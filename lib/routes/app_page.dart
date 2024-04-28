import 'package:get/get.dart';
import 'package:moonair/modules/authen/authen_binding.dart';
import 'package:moonair/modules/authen/screens/forgot_password_screen.dart';
import 'package:moonair/modules/authen/screens/login_screen.dart';
import 'package:moonair/modules/authen/screens/reset_password_screen.dart';
import 'package:moonair/modules/authen/screens/signup_sceen.dart';
import 'package:moonair/modules/authen/screens/welcom_screen.dart';
import 'package:moonair/routes/app_route.dart';

class AppPages {
  static final List<GetPage> pages = [
    //welcome
    GetPage(
      name: AppRoutes.welcomePage,
      page: () => WelcomScreen(),
      transition: Transition.cupertino,
      binding: AuthenBinding(),
    ),
    //1. authen
    //login
    GetPage(
      name: AppRoutes.loginPage,
      page: () => LoginScreen(),
      transition: Transition.cupertino,
      binding: AuthenBinding(),
    ),
    //signup
    GetPage(
      name: AppRoutes.signUpPage,
      page: () => SignUpScreen(),
      transition: Transition.cupertino,
      binding: AuthenBinding(),
    ),
    //forgot password
    GetPage(
      name: AppRoutes.forgotPasswordPage,
      page: () => ForgotPasswordScreen(),
      transition: Transition.cupertino,
      binding: AuthenBinding(),
    ),
    //reset password
    GetPage(
      name: AppRoutes.resetPasswordPage,
      page: () => PasswordResetScreen(),
      transition: Transition.cupertino,
      binding: AuthenBinding(),
    ),
  ];
}
