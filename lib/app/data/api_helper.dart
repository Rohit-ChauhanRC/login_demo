import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../main.dart';
import '../utils/storage/storage.dart';
import 'app_reponse.dart';
import 'errors/app_errors.dart';
import 'models/login_model.dart';

class ApiHelper extends GetConnect with AppResponse {
  @override
  void onInit() {
    httpClient.baseUrl = "https://curr.logiclane.tech/api/auth/local";
    httpClient.timeout = const Duration(seconds: 3);

    httpClient.addResponseModifier((request, response) {
      return response;
    });
  }

  Future<Either<AppErrors, dynamic>> signUp(
    FormData body,
  ) {
    return post(
      '/signup',
      body,
      // decoder: (data) => LoginModel.fromJson(data),
    ).then(
      (value) => getResponse(value),
    );
  }

  Future<Either<AppErrors, LoginModel>> login(
    Map body,
  ) {
    return post(
      '/login',
      body,
      decoder: (data) => LoginModel.fromJson(data),
    ).then(
      (value) => getResponse(value),
    );
  }
}
