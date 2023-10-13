import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_demo/app/routes/app_pages.dart';
import 'package:login_demo/app/utils/utils_export.dart';

import '../../../utils/values/app_colors.dart';
import '../../../widgets/text_form_widget.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 30.h,
              left: 20.w,
              right: 20.w,
              bottom: 20.h,
            ),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Form(
              key: controller.signUpFormKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(
                            Routes.LOGIN,
                          );
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Log in",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 20.h,
                    ),
                    child: TextFormWidget(
                      hintText: "Email",
                      labelText: "Email",
                      validator: (input) => Validators.checkEmail(input!),
                      textInputType: TextInputType.text,
                      onSaved: (v) => controller.email = v!,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 20.h,
                    ),
                    child: TextFormWidget(
                      hintText: "Username",
                      labelText: "Username",
                      validator: (input) => Validators.userName(input!),
                      textInputType: TextInputType.text,
                      onSaved: (v) => controller.username = v!,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 20.h,
                    ),
                    child: TextFormWidget(
                      hintText: "First Name",
                      labelText: "First Name",
                      validator: (input) => Validators.userName(input!),
                      textInputType: TextInputType.text,
                      onSaved: (v) => controller.name = v!,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 20.h,
                    ),
                    child: TextFormWidget(
                      hintText: "Middle Name",
                      labelText: "Middle Name",
                      textInputType: TextInputType.text,
                      onSaved: (v) => controller.middlename = v!,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 20.h,
                    ),
                    child: TextFormWidget(
                      hintText: "Last Name",
                      labelText: "Last Name",
                      validator: (input) => Validators.userName(input!),
                      textInputType: TextInputType.text,
                      onSaved: (v) => controller.lastname = v!,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 10.h,
                    ),
                    child: TextFormWidget(
                      onSaved: (v) => controller.mobileNumber = v!,
                      hintText: Strings.mobileNumber,
                      labelText: Strings.mobileNumber,
                      validator: (input) => Validators.mobileNumber(input!),
                      textInputType: TextInputType.number,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 10.h,
                    ),
                    child: TextFormWidget(
                      hintText: Strings.address,
                      labelText: Strings.address,
                      validator: (input) => Validators.address(input!),
                      onSaved: (v) => controller.address = v!,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 10.h,
                    ),
                    child: TextFormWidget(
                      hintText: "Street1",
                      labelText: "Street1",
                      validator: (input) => Validators.address(input!),
                      onSaved: (v) => controller.street1 = v!,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 10.h,
                    ),
                    child: TextFormWidget(
                      hintText: "Street2",
                      labelText: "Street2",
                      validator: (input) => Validators.address(input!),
                      onSaved: (v) => controller.street2 = v!,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 10.h,
                    ),
                    child: TextFormWidget(
                      hintText: Strings.city,
                      labelText: Strings.city,
                      validator: (input) => Validators.city(input!),
                      onSaved: (v) => controller.city = v!,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 10.h,
                    ),
                    child: TextFormWidget(
                      hintText: Strings.state,
                      labelText: Strings.state,
                      validator: (input) => Validators.state(input!),
                      onSaved: (v) => controller.state = v!,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 10.h,
                    ),
                    child: TextFormWidget(
                      hintText: Strings.postalCode,
                      labelText: Strings.postalCode,
                      validator: (input) => Validators.postalCode(input!),
                      onSaved: (v) => controller.postalCode = v!,
                      textInputType: TextInputType.number,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 10.h,
                    ),
                    child: TextFormWidget(
                      hintText: "Country",
                      labelText: "country",
                      validator: (input) => Validators.state(input!),
                      onSaved: (v) => controller.country = v!,
                    ),
                  ),

                  // password

                  Obx(
                    () => Container(
                      margin: EdgeInsets.only(
                        top: 10.h,
                      ),
                      child: TextFormWidget(
                        hintText: Strings.enterPassword,
                        labelText: Strings.enterPassword,
                        validator: (input) => Validators.passwordCheck(input!),
                        // controller: controller.passwordController,
                        onChanged: (v) => controller.password = v!,
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
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: Get.width,
                          child: TextButton(
                            onPressed: controller.validFormKey,
                            child: const Text(
                              Strings.signUp,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      : const CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  List<Object?> get props => [];
}
