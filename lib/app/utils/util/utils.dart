import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils_export.dart';

class Utils {
  const Utils._();

  static void showDialog(
    String message, {
    String title = Strings.error,
    bool success = false,
    required Function()? onTap,
  }) =>
      Get.defaultDialog(
        barrierDismissible: false,
        onWillPop: () async {
          Get.back();

          onTap?.call();

          return true;
        },
        title: success ? Strings.success : title,
        content: Text(
          message ?? Strings.somethingWentWrong,
          textAlign: TextAlign.center,
          maxLines: 6,
          style: TextStyle(
            color: AppColors.mineShaft,
            fontSize: Dimens.fontSize16,
          ),
        ),
        confirm: Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {
              Get.back();

              onTap?.call();
            },
            child: Text(
              Strings.ok,
              style: TextStyle(
                fontSize: Dimens.fontSize18,
                color: AppColors.kPrimaryColor,
              ),
            ),
          ),
        ),
      );

  static void loadingDialog() {
    Utils.closeDialog();

    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  static void closeDialog() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }

  static void closeSnackbar() {
    if (Get.isSnackbarOpen) {
      Get.back();
    }
  }

  static void showSnackbar(String message) {
    closeSnackbar();

    Get.rawSnackbar(message: message);
  }

  static void closeKeyboard() {
    final currentFocus = Get.focusScope;
    // if (!currentFocus.hasPrimaryFocus) {
    currentFocus!.unfocus();
    // }
  }

  static void goBackToScreen(String routeName) {
    Get.until(
      (route) => Get.currentRoute == routeName,
    );
  }
}
