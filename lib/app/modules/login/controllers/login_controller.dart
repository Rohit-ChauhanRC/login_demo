import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:login_demo/app/data/extensions.dart';
import 'package:login_demo/app/routes/app_pages.dart';

import '../../../data/api_helper.dart';
import '../../../utils/storage/storage.dart';
import '../../../utils/util/utils.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final ApiHelper _apiHelper = Get.find<ApiHelper>();

  final RxBool _obscureText = true.obs;
  bool get obscureText => _obscureText.value;
  void setObscureText() => _obscureText.value = !obscureText;

  final RxBool _circularProgress = true.obs;
  bool get circularProgress => _circularProgress.value;
  set circularProgress(bool v) => _circularProgress.value = v;

  String _email = '';
  String get email => _email;
  set email(String name) => this._email = name;

  String _mobileNumber = '';
  String get mobileNumber => _mobileNumber;
  set mobileNumber(String mobileNumber) => this._mobileNumber = mobileNumber;

  String _password = '';
  String get password => _password;
  set password(String password) => this._password = password;

  @override
  void onInit() {
    super.onInit();

    _initFields();
  }

  validFormKey() async {
    if (!loginFormKey.currentState!.validate()) {
      return;
    }

    Utils.closeKeyboard();
    loginFormKey.currentState!.save();

    final _body = {};

    _body['email'] = email;
    _body['password'] = password;
    // _body['device_token'] = Constants.TOKEN;
    try {
      var response = await http.post(
          Uri.parse('https://curr.logiclane.tech/api/auth/local/login'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(_body));

      if (response.statusCode == 201 || response.statusCode == 200) {
        Get.toNamed(Routes.HOME);
        Utils.showSnackbar("Login Success");
      } else {
        Utils.showSnackbar(response.body);
      }
    } catch (e) {
      Utils.showSnackbar(e.toString());
    }

    // _apiHelper.login(_body).futureValue((v) {
    //   if (v.success!) {
    //   } else {}
    // });
  }

  void _initFields() {
    mobileNumber = '';
    password = '';
  }
}
