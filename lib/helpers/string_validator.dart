
import 'regex.dart';

class StringValidator {
  static String? fieldValidator({ String? value, String? field}) {
    if (value==null || value.isEmpty) {
        return '${field??"This"} field can\'t be empty';
     
    } else {
      return null;
    }
  }

  static String? emailValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Email address can\'t be empty';
    } else if (!Regex.email.hasMatch(value ?? "")) {
      return 'invalid email address.';
    } else {
      return null;
    }
  }

  static String? usenameValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Username can\'t be empty';
    } else if (value.length <= 5) {
      return "Username must not be less than 6 characters";
    } else {
      return null;
    }
  }

  static String? passwordValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Password can\'t be empty';
    } else if (value.length <= 5) {
      return "Password must not be less than 6 characters";
    } else {
      return null;
    }
  }

  static String? confirmPasswordValidator(value, password) {
    if (value == null || value.isEmpty) {
      return 'confirm password can\'t be empty';
    } else if (value != password) {
      return 'Password not match';
    } else if (value.length <= 5) {
      return "Password must not be less than 6 characters";
    } else {
      return null;
    }
  }

  static String? displayNameValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Display name can\'t be empty';
    } else if (value.length <= 2) {
      return "Display name  must not be less than 3 characters";
    } else {
      return null;
    }
  }

}
