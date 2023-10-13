import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:get/get.dart';

import '../routes/app_pages.dart';
import '../utils/util/utils.dart';
import '../utils/values/strings.dart';
import 'errors/app_errors.dart';

mixin AppResponse {
  Either<AppErrors, T> getResponse<T>(Response<T> response) {
    final status = response.status;

    if (status.connectionError) {
      return Left(NoConnectionError());
    }

    try {
      final res = jsonDecode(response.bodyString!);

      if (!response.hasError && response.statusCode == 200) {
        if ((res['status'] is bool && !res['status']) ||
            res['status'] is String && res['status'] != 'OK') {
          if (res['error_message'] != null &&
              res['error_message'].toString().isNotEmpty) {
            return _leftError(ApiError(
              message: res['error_message']?.toString() ?? Strings.unknownError,
            ));
          } else {
            return _leftError(ApiError(
              message: res['message']?.toString() ?? Strings.unknownError,
            ));
          }
        }

        return Right(response.body!);
      } else {
        if (status.isServerError) {
          return _leftError<T>(ApiError());
        } else if (response.unauthorized) {
          return _leftError(UnauthorizeError());
        } else {
          return _leftError<T>(
            ApiError(
              message: res['message']?.toString() ?? Strings.unknownError,
            ),
          );
        }
      }
    } on FormatException catch (e) {
      return _leftError<T>(ApiError(
        message: e?.toString() ?? Strings.unknownError,
      ));
    } on TimeoutException {
      return Left(TimeoutError());
    }
  }

  Either<AppErrors, T> _leftError<T>(AppErrors errors) {
    Utils.closeDialog();

    Utils.showDialog(
      errors.message,
      onTap: errors.message != UnauthorizeError().message
          ? null
          : () => Get.offAllNamed(Routes.LOGIN),
    );

    return Left(errors);
  }
}
