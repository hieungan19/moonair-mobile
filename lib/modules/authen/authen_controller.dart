import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:moonair/core/ultils.dart';
import 'package:moonair/core/values/api_url.dart';
import 'package:moonair/data/models/user.dart';
import 'package:moonair/data/services/data_center.dart';
import 'package:moonair/routes/app_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController code = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  var selectedGender = 'male'.obs;

  final _ggSignIn = GoogleSignIn();
  static late String? idToken;
  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? ggSignInAccount = await _ggSignIn.signIn();
      if (ggSignInAccount != null) {
        // Signup voi BE
        var body = jsonEncode({
          'email': ggSignInAccount.email,
          'name': ggSignInAccount.displayName,
          'photo': ggSignInAccount.photoUrl,
          'googleId': ggSignInAccount.id,
        });
        var url = Uri.parse(UrlValue.ggLoginUrl);

        var response = await http.post(url,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: body);
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);

          DataCenter.token = data["token"];
          await saveToken(data["token"]);
          DataCenter.user = UserModel.fromJson(data["user"]);
          showSnackbar(
              title: "Thành công",
              content: "Đăng nhập thành công",
              color: Colors.green);

          Future.delayed(const Duration(seconds: 2), () {
            Get.toNamed(AppRoutes.homePage);
          });
        } else {
          throw Error();
        }
      }
    } catch (e) {
      showSnackbar(
          title: "Lỗi",
          content: "Đăng nhập không thành công",
          color: Colors.red[400]);
    }
  }

  void selectGender(String gender) {
    selectedGender.value = gender;
  }

  void navigateToLoginScreen() {
    Get.toNamed(AppRoutes.loginPage);
  }

  void navigateToSignUpScreen() {
    Get.toNamed(AppRoutes.signUpPage);
  }

  void navigateToForgotPasswordScreen() {
    Get.toNamed(AppRoutes.forgotPasswordPage);
  }

  Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<void> deleteToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

  void logout() async {
    await deleteToken();
    Get.toNamed(AppRoutes.loginPage);
  }

  void login() async {
    try {
      var url = Uri.parse(UrlValue.loginUrl);
      var body = jsonEncode({
        'email': email.text,
        'password': password.text,
      });
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        DataCenter.token = data["token"];
        await saveToken(data["token"]);
        DataCenter.user = UserModel.fromJson(data["user"]);
        showSnackbar(
            title: "Thành công",
            content: "Đăng nhập thành công",
            color: Colors.green);
        Future.delayed(const Duration(seconds: 2), () {
          Get.toNamed(AppRoutes.base);
        });
      } else {
        throw Error();
      }
    } catch (err) {
      showSnackbar(
          title: "Lỗi",
          content: "Đăng nhập không thành công",
          color: Colors.red[400]);
    }
  }

  void signUp() async {
    try {
      var url = Uri.parse(UrlValue.signUpUrl);
      var body = jsonEncode({
        'email': email.text,
        'password': password.text,
        'name': name.text,
        'confirmPassword': confirmPassword.text,
        'phoneNumber': phoneNumber.text,
        'gender': selectedGender.value
      });

      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);
      if (response.statusCode == 200) {
        showSnackbar(
            title: "Thành công",
            content: "Đăng kí thành công.Vui lòng đăng nhập.",
            color: Colors.green);

        Future.delayed(const Duration(seconds: 2), () {
          Get.toNamed(AppRoutes.loginPage);
        });
      } else {
        print(response.body);
        throw Error();
      }
    } catch (err) {
      print(err.toString());
      showSnackbar(
          title: "Lỗi",
          content: "Đăng kí không thành công",
          color: Colors.red[400]);
    }
  }

  void sendResetPassword() async {
    try {
      var url = Uri.parse(UrlValue.forgotPasswordUrl);
      var body = jsonEncode({
        'email': email.text,
      });
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);

      if (response.statusCode == 200) {
        showSnackbar(
            title: "Thành công",
            content: "Mã xác nhận đã gửi thành công",
            color: Colors.green);
      } else {
        throw Error();
      }
    } catch (err) {
      showSnackbar(
          title: "Lỗi",
          content:
              "Gửi mã không thành công. Vui lòng nhập lại email và tiến hành gửi lại.",
          color: Colors.red[400]);
    }
  }

  void checkResetPasswordCode() async {
    try {
      var url = Uri.parse(UrlValue.checkResetPasswordUrl);
      var body = jsonEncode({
        'email': email.text,
        'resetPassword': code.text,
      });
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);

      if (response.statusCode == 200) {
        Get.toNamed(AppRoutes.resetPasswordPage);
      } else {
        throw Error();
      }
    } catch (err) {
      showSnackbar(
          title: "Lỗi",
          content: "Mã xác nhận không đúng. Vui lòng kiểm tra và nhập lại.",
          color: Colors.red[400]);
    }
  }

  void resetPassword() async {
    try {
      var url = Uri.parse(UrlValue.resetPasswordUrl);

      var body = jsonEncode({
        'resetPassword': code.text,
        'email': email.text,
        'password': password.text,
        'passwordConfirm': confirmPassword.text
      });
      print(body);
      var response = await http.patch(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        DataCenter.token = data["token"];
        DataCenter.user = UserModel.fromJson(data["user"]);
        showSnackbar(
            title: "Thành công",
            content: "Đổi mật khẩu mới thành công. Vui lòng đăng nhập lại.",
            color: Colors.green);
        Future.delayed(const Duration(seconds: 2), () {
          Get.toNamed(AppRoutes.loginPage);
        });
      }
    } catch (err) {
      showSnackbar(
          title: "Lỗi",
          content: "Đổi mật khẩu mới không thành công.",
          color: Colors.red[400]);
    }
  }
}
