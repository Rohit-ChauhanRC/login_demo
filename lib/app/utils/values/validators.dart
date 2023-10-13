import 'Strings.dart';

class Validators {
  const Validators._();

  static String? validateEmpty(String v) {
    if (v.isEmpty) {
      return "Field can't be empty!";
    } else {
      return null;
    }
  }

  static const Pattern patternNameOnlyChar =
      r'^[A-Za-z ]+(?:[ _-][A-Za-z ]+)*$';
  static const Pattern passwordMinLen8withCamelAndSpecialChar =
      r'^((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\W_]).{8,20})';
  static const Pattern passwordMinLen8withLowerCaseAndSpecialChar =
      r'^((?=.*\d)(?=.*[a-z])(?=.*[\W_]).{8,20})';
  static const Pattern patternEmail =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const Pattern patternPhone = r'^(?:[+0]9)?[0-9]{11}$';

  static bool hasMatch(String value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }

  static bool hasLength(dynamic value) {
    return value is Iterable || value is String || value is Map;
  }

  static bool dateTime(String s) =>
      hasMatch(s, r'^\d{4}-\d{2}-\d{2}[ T]\d{2}:\d{2}:\d{2}.\d{3}Z?$');
  //
  static String? userName(String value) {
    if (value.isEmpty) {
      return 'Field is empty!';
    } else if (value.length < 3) {
      return Strings.errorFullName;
    } else {
      return null;
    }
  }

  static String? checkEmail(String value) {
    if (value.isEmpty) {
      return 'Field is empty!';
    } else if (!value.contains("@")) {
      return "Enter valid email!";
    } else {
      return null;
    }
  }

  static String? address(String value) {
    if (value.isEmpty) {
      return 'Field is empty!';
    } else if (value.length < 3) {
      return Strings.errorAddress;
    } else {
      return null;
    }
  }

  static String? city(String value) {
    if (value.isEmpty) {
      return 'Field is empty!';
    } else if (value.length < 3) {
      return Strings.errorCity;
    } else {
      return null;
    }
  }

  static String? state(String value) {
    if (value.isEmpty) {
      return 'Field is empty!';
    } else if (value.length < 3) {
      return Strings.errorState;
    } else {
      return null;
    }
  }

  static String? mobileNumber(String value) {
    if (value.isEmpty) {
      return 'Field is empty!';
    } else if (value.length < 10) {
      return Strings.errorMobileNumber;
    } else {
      return null;
    }
  }

  static String? postalCode(String value) {
    if (value.isEmpty) {
      return 'Field is empty!';
    } else if (value.length < 6) {
      return Strings.errorPostalCode;
    } else {
      return null;
    }
  }

  static String? passwordCheck(String value) {
    if (value.isEmpty) {
      return 'Field is empty!';
    } else if (value.length < 8) {
      return Strings.errorPassword;
    } else {
      return null;
    }
  }

  static String? repasswordCheck(
    String input,
    String value,
  ) {
    if (input.isEmpty) {
      return 'Field is empty!';
    } else if (input != value) {
      return Strings.errorRePassword;
    } else {
      return null;
    }
  }
}
