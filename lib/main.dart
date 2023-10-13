import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:login_demo/app/utils/storage/storage.dart';
import 'app/routes/app_pages.dart';
import 'app/utils/util/initializer.dart';
import 'package:network_info_plus/network_info_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<void> checkdataInfo() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.deviceInfo;
    final allInfo = deviceInfo.data;

    final info = NetworkInfo();
    var hostAddress = await info.getWifiIP();

    if (kDebugMode) {
      print("model: ${allInfo['model']}");
      print("id: ${allInfo['id']}");
      print("hostAddress: $hostAddress");
    }

    Storage.saveValue("deviceModel", allInfo['model']);
    Storage.saveValue("deviceId", allInfo['id']);
    Storage.saveValue("deviceIp", hostAddress);
  }

  @override
  Widget build(BuildContext context) {
    Initializer.init();

    checkdataInfo();
    ScreenUtil.init(
      context,
    );
    return GetMaterialApp(
      title: 'Login Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
