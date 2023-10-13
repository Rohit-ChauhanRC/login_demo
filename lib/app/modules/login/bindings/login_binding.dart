import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(
      LoginController(),
    );
    Get.put<FormState>(FormState());
  }
}
