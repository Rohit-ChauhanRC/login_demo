import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/sign_up_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SignUpController>(
      SignUpController(),
    );

    Get.put<FormState>(FormState());
  }
}
