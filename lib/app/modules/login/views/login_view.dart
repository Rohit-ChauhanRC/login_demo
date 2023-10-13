import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/values/Strings.dart';
import '../../../utils/values/app_colors.dart';
import '../../../utils/values/validators.dart';
import '../../../widgets/text_form_widget.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.transparent,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 20.h,
            ),
            height: ScreenUtil().screenHeight / 8,
            width: ScreenUtil().screenWidth / 1.5,
            child: const FlutterLogo(),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 50.h,
              left: 20.w,
              right: 20.w,
            ),
            padding: const EdgeInsets.all(15),
            child: Form(
              key: controller.loginFormKey,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 26.sp,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 20.h,
                    ),
                    child: TextFormWidget(
                      hintText: "Email",
                      labelText: "Email",
                      validator: (input) => Validators.userName(input!),
                      textInputType: TextInputType.text,
                      onSaved: (v) => controller.email = v!,
                    ),
                  ),
                  Obx(
                    () => Container(
                      margin: EdgeInsets.only(
                        top: 10.h,
                      ),
                      child: TextFormWidget(
                        onChanged: (v) => controller.password = v!,
                        hintText: Strings.password,
                        labelText: Strings.password,
                        validator: (input) => Validators.passwordCheck(input!),
                        isObscure: controller.obscureText,
                        suffixIcon: IconButton(
                          onPressed: controller.setObscureText,
                          icon: Icon(
                            !controller.obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: !controller.obscureText
                                ? AppColors.kPrimaryColor
                                : Colors.grey[400],
                          ),
                        ),
                      ),
                    ),
                  ),
                  controller.circularProgress
                      ? Container(
                          margin: EdgeInsets.only(
                            top: 30.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: Get.width,
                          child: TextButton(
                            onPressed: controller.validFormKey,
                            child: const Text(
                              Strings.login,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      : const CircularProgressIndicator(),
                  Container(
                    margin: EdgeInsets.only(
                      top: 50.h,
                    ),
                    alignment: Alignment.center,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Strings.notAMember,
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed('/sign-up');
                            },
                            child: Text(
                              Strings.signUp,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.kPrimaryColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
