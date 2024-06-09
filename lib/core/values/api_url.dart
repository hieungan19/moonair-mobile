import 'package:flutter_dotenv/flutter_dotenv.dart';

class UrlValue {
  static final app = dotenv.env['API_URL'];

  //authen
  static final loginUrl = "$app/users/login";
  static final signUpUrl = "$app/users/signup";
  static final forgotPasswordUrl = "$app/users/forgotPassword";
  static final resetPasswordUrl = "$app/users/resetPassword";
  static final checkResetPasswordUrl = "$app/users/checkResetPassword";
  static final ggLoginUrl = "$app/users/gglogin";
  static final userInfo = "$app/users/me";
  static final flights = "$app/flights";

  // flight
  static final airports = "$app/airports";

  //invoice
  static final invoices = '$app/invoices';
}
