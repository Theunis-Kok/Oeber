import 'package:email_validator/email_validator.dart';

String? emailValidator(String? email) {
  return email != null && !EmailValidator.validate(email)
      ? 'Enter a valid email'
      : null;
}

String? passwordValidator(String? password) {
  return password != null && password.length < 6
      ? 'Enter a min. 6 characters'
      : null;
}
