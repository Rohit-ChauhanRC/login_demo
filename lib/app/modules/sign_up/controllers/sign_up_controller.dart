import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_demo/app/data/extensions.dart';
import 'package:login_demo/app/utils/storage/storage.dart';

import '../../../data/api_helper.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/util/utils.dart';
import 'package:http/http.dart' as http;

class SignUpController extends GetxController {
  final ApiHelper _apiHelper = Get.put<ApiHelper>(ApiHelper());

  final RxBool _obscureText = true.obs;
  final RxBool _obscureText1 = true.obs;

  bool get obscureText => _obscureText.value;
  void setObscureText() => _obscureText.value = !obscureText;

  bool get obscureText1 => _obscureText1.value;
  void setObscureText1() => _obscureText1.value = !obscureText1;

  String initialValue = '1234567890';

  String _password = '';
  String get password => _password;
  set password(String password) => _password = password;

  String _password1 = '';
  String get password1 => _password1;
  set password1(String password1) => _password1 = password1;

  String _name = '';
  String get name => _name;
  set name(String name) => _name = name;

  String _lastname = '';
  String get lastname => _lastname;
  set lastname(String name) => _lastname = name;

  String _middlename = '';
  String get middlename => _middlename;
  set middlename(String name) => _middlename = name;

  String _username = '';
  String get username => _username;
  set username(String name) => _username = name;

  String _email = '';
  String get email => _email;
  set email(String name) => _email = name;

  String _address = '';
  String get address => _address;
  set address(String address) => _address = address;

  String _street1 = '';
  String get street1 => _street1;
  set street1(String address) => _street1 = address;

  String _street2 = '';
  String get street2 => _street2;
  set street2(String address) => _street2 = address;

  String _city = '';
  String get city => _city;
  set city(String city) => _city = city;

  String _state = '';
  String get state => _state;
  set state(String state) => _state = state;

  String _postalCode = '';
  String get postalCode => _postalCode;
  set postalCode(String postalCode) => _postalCode = postalCode;

  String _mobileNumber = '';
  String get mobileNumber => _mobileNumber;
  set mobileNumber(String mobileNumber) => _mobileNumber = mobileNumber;

  String _country = '';
  String get country => _country;
  set country(String countryName) => _country = countryName;

  String _vechicleNumber = '';
  String get vechicleNumber => _vechicleNumber;
  set vechicleNumber(String vechicleNumber) => _vechicleNumber = vechicleNumber;

  String _vehicleModel = '';
  String get vehicleModel => _vehicleModel;
  set vehicleModel(String vehicleModel) => _vehicleModel = vehicleModel;

  String _vehicleColor = '';
  String get vehicleColor => _vehicleColor;
  set vehicleColor(String vehicleColor) => _vehicleColor = vehicleColor;

  late DateTime _startDateVehicle;
  DateTime get startDateVehicle => _startDateVehicle;
  set startDateVehicle(DateTime startDateVehicle) =>
      _startDateVehicle = startDateVehicle;

  late DateTime _endDateVehicle;
  DateTime get endDateVehicle => _endDateVehicle;
  set endDateVehicle(DateTime endDateVehicle) =>
      _endDateVehicle = endDateVehicle;

  String _bankName = '';
  String get bankName => _bankName;
  set bankName(String bankName) => _bankName = bankName;

  String _branchName = '';
  String get branchName => _branchName;
  set branchName(String branchName) => _branchName = branchName;

  String _accountNumber = '';
  String get accountNumber => _accountNumber;
  set accountNumber(String accountNumber) => _accountNumber = accountNumber;

  String _confirmAccount = '';
  String get confirmAccount => _confirmAccount;
  set confirmAccount(String confirmAccount) => _confirmAccount = confirmAccount;

  String _newAccountNumber = '';
  String get newAccountNumber => _newAccountNumber;
  set newAccountNumber(String newAccountNumber) =>
      _newAccountNumber = newAccountNumber;

  String _ifscCode = '';
  String get ifscCode => _ifscCode;
  set ifscCode(String ifscCode) => _ifscCode = ifscCode;

  // longitude, latitude
  String _longitude = '';
  String get longitude => _longitude;
  set longitude(String longitudeT) => _longitude = longitudeT;

  String _latitude = '';
  String get latitude => _latitude;
  set latitude(String latitudeT) => _latitude = latitudeT;

  final RxBool _check = true.obs;

  bool get check => _check.value;
  void setcheck(bool v) => _check.value = v;

  // var _image1 = Rx<File>();

  // Rx<File> get image1 => _image1;

  // var _image2 = Rx<File>();

  // Rx<File> get image2 => _image2;

  // var _image3 = Rx<File>();

  // Rx<File> get image3 => _image3;
  // final Rx<File> _shopImage = Rx<File>();
  final Rx<File> _drivingLicenceFileImage = Rx<File>(File(''));
  File get drivingLicenceFileImage => _drivingLicenceFileImage.value;
  set drivingLicenceFileImage(File v) => _drivingLicenceFileImage.value = v;

  final Rx<File> _vehicleFileImage = Rx<File>(File(''));
  File get vehicleUploadFileImage => _vehicleFileImage.value;
  set vehicleUploadFileImage(File v) => _vehicleFileImage.value = v;

  final Rx<File> _aadarFileImage = Rx<File>(File(''));
  File get aadarFileImage => _aadarFileImage.value;
  set aadarFileImage(File v) => _aadarFileImage.value = v;

  late TextEditingController vehicleUpload;
  // final _picker = ImagePicker();

  late GlobalKey<FormState> signUpFormKey;

  late String inputValue;

  late List<String> listOfNum, bankNameList = [];

  final RxBool _circularProgress = true.obs;
  bool get circularProgress => _circularProgress.value;
  set circularProgress(bool v) => _circularProgress.value = v;

  @override
  void onInit() {
    super.onInit();

    listOfNum = <String>['+91', '+11'];
    bankNameList = <String>['SBI', 'CBI', 'UCO'];

    signUpFormKey = GlobalKey<FormState>();
    // geo locations
    vehicleUpload = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();

    _obscureText?.close();
    _obscureText1?.close();

    _aadarFileImage?.close();
    _drivingLicenceFileImage?.close();
    _vehicleFileImage?.close();

    vehicleUpload?.dispose();
  }

  dropDownChangedValue(String input) {
    inputValue = input;
    update();
  }

  dropDownChangedBankValue(String input) {
    bankName = input;
    update();
  }

  checkValueChanged(bool value) {
    update();
  }

  validFormKey() async {
    if (!signUpFormKey.currentState!.validate()) {
      return;
    }
    signUpFormKey.currentState!.save();
    Utils.closeKeyboard();

    final _body = <String, dynamic>{};

    _body['email'] = email;
    _body['password'] = password;
    _body['username'] = username;
    _body['firstName'] = name;
    _body['middleName'] = middlename;
    _body['lastName'] = lastname;
    _body['phoneNumber'] = mobileNumber;
    _body['walletPin'] = 0;
    _body['deviceId'] = Storage.getValue("deviceId");
    _body['deviceIp'] = Storage.getValue("deviceIp");
    _body['deviceModel'] = Storage.getValue("deviceModel");

    _body['billingAddress'] = {
      "street1": street1,
      "street2": street2,
      "city": city,
      "state": state,
      "zipCode": postalCode,
      "country": country
    };

    if (kDebugMode) {
      print("$_body");
    }

    final FormData _formData = FormData(_body);
    print(_formData);

    // var client = http.Client();
    // final bd = {
    //   "email": email,
    //   "password": password,
    //   "username": username,
    //   "firstName": name,
    //   "middleName": middlename,
    //   "lastName": lastname,
    //   "phoneNumber": mobileNumber,
    //   "walletPin": 0,
    //   "deviceId": Storage.getValue("deviceId"),
    //   "deviceIp": Storage.getValue("deviceIp"),
    //   "deviceModel": Storage.getValue("deviceModel"),
    //   "billingAddress": {
    //     "street1": street1,
    //     "street2": street2,
    //     "city": city,
    //     "state": state,
    //     "zipCode": postalCode,
    //     "country": country
    //   }
    // };
    try {
      var response = await http.post(
          Uri.parse('https://curr.logiclane.tech/api/auth/local/signup'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(_body));

      if (response.statusCode == 201) {
        Get.toNamed(Routes.HOME);
        Utils.showSnackbar("Sign Up Success");
      } else {
        Utils.showSnackbar(response.body);
      }
    } catch (e) {
      Utils.showSnackbar(e.toString());
    }

    // _apiHelper.signUp(_formData).futureValue((v) {
    //   Get.toNamed(
    //     Routes.HOME,
    //   );
    //   if (kDebugMode) {
    //     print("$v");
    //   }
    // });
  }
}
