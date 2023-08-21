import 'package:email_validator/email_validator.dart';

//TODO IMPLEMENT VALIDATION ON TEXTFIELD AND FIREBASE RETURN MESSAGES!!!

String? emailValidator(String? email) {
  return email == null || !EmailValidator.validate(email)
      ? 'Invalid Email'
      : null;
}

String? passwordValidator(String? password) {
  return password == null || password.length < 6
      ? 'Password must be a minimum of 6 characters'
      : null;
}

String? confirmPasswordValidator(String? password, String? confirmPassword) {
  return password == null || password.length < 6 || password != confirmPassword
      ? 'Passwords do not match'
      : null;
}
