import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../main.dart';
import '../utils/storage/storage.dart';
import '../utils/util/utils.dart';
import 'errors/app_errors.dart';
import 'interface_controller/api_interface_controller.dart';

class Extensions {}

extension BorderRadiusExt on num {
  BorderRadius get borderRadius => BorderRadius.circular(r);

  InputBorder outlineInputBorder({
    BorderSide borderSide = BorderSide.none,
  }) =>
      OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: borderSide,
      );
}

extension HexColorExt on String {
  Color get fromHex {
    final buffer = StringBuffer();
    if (length == 6 || length == 7) {
      buffer.write('ff');
    }

    if (startsWith('#')) {
      buffer.write(replaceFirst('#', ''));
    }
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

extension StorageExt on String {
  void saveValue({
    required String key,
  }) =>
      Storage.saveValue(key, this);
  //this -> value to be saved

  T getValue<T>() => Storage.getValue<T>(this);
  //this -> key to get

  void removeValue() => Storage.removeValue(this);
  //this -> key to get
}

extension FutureExt<T> on Future<Either<AppErrors, T>> {
  void futureValue(
    Function(T value) response, {
    Function(String error)? onError,
    VoidCallback? retryFunction,
  }) {
    final _interface = Get.find<ApiInterfaceController>();
    _interface.error = null;

    Utils.loadingDialog();

    then((value) {
      value.fold(
        (l) {
          if (onError != null) {
            onError(l.message);
          }

          if (l is NoConnectionError || l is TimeoutError) {
            Utils.closeDialog();

            Utils.showSnackbar(l.message);

            if (l is NoConnectionError) {
              _interface.error = NoConnectionError();

              if (retryFunction != null) {
                _interface.retry = retryFunction;
              }
            }
          }
        },
        (r) {
          Utils.closeDialog();
          response(r);
        },
      );
    }).catchError((e) {
      Utils.closeDialog();

      if (e != null) {
        Utils.showDialog(e.toString(), onTap: () {});

        if (e is NoConnectionError || e is TimeoutError) {
          Utils.showSnackbar(e.message);
        }
      }

      if (onError != null) {
        onError(e.toString());
      }
    }).timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        Utils.closeDialog();
        Utils.showSnackbar(TimeoutError().message);
      },
    );
  }
}

extension ModealBottomExt on Widget {
  showBottomSheet() {
    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      builder: (_) => this,
    );
  }
}

extension WidgetExt on Widget {
  Widget align({
    Alignment alignment = Alignment.center,
  }) =>
      Align(
        alignment: alignment,
        child: this,
      );

  Widget onClick({required void Function()? onTap}) => InkWell(
        onTap: onTap,
        child: this,
      );
}
