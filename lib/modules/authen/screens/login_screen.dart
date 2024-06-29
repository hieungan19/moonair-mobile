import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/modules/authen/authen_controller.dart';
import '../../../global_widgets/button.dart';
import '../../../core/app_themes.dart';
import '../../../values/app_assets/app_images.dart';
import '../../../global_widgets/text_field.dart';
import 'package:line_icons/line_icons.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final AuthenController _controller = Get.find();

  Widget logInWithGoogleButton(
      VoidCallback onPressedFunction, BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.white,
            side: const BorderSide(width: 1, color: AppColors.grey1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: onPressedFunction,
        child: SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  AppImages.googleIcon,
                  height: 30,
                ),
                Expanded(
                  child: Text("Đăng nhập bằng google",
                      textAlign: TextAlign.center,
                      style: CustomTextStyle.p1(Colors.black)),
                ),
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.background, AppColors.secondary],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Image.asset(
                    'lib/assets/logo/logo_name.png',
                  ),
                ),

                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 100.0),
                  child: Text(
                    'Hãy đăng nhập vào tài khoản của bạn!',
                    style: CustomTextStyle.h3(AppColors.primary),
                    textAlign: TextAlign.left,
                  ),
                ),

                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 150),
                  child: Text(
                    'Điền những thông tin dưới đây.',
                    style: CustomTextStyle.p3(AppColors.info),
                    textAlign: TextAlign.left,
                  ),
                ),

                const SizedBox(height: 40),

                SizedBox(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        logInWithGoogleButton(
                            _controller.signInWithGoogle, context),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),
                Image.asset(AppImages.devideWidget),
                const SizedBox(height: 30),

                //Text Field nhập email
                SizedBox(
                    height: 50,
                    child: MyTextField(
                      controller: _controller.email,
                      hintText: 'Nhập email',
                      obscureText: false,
                      suffixIcon: const Icon(LineIcons.envelope),
                    )),
                const SizedBox(height: 15),

                //Text Field nhập password
                const SizedBox(height: 20),

                SizedBox(
                    height: 50,
                    child: MyTextField(
                        controller: _controller.password,
                        hintText: 'Nhập mật khẩu',
                        obscureText: true)),

                TextButton(
                  onPressed: _controller.navigateToForgotPasswordScreen,
                  child: Text(
                    'Quên mật khẩu?',
                    style: CustomTextStyle.p2(AppColors.primary).copyWith(
                      decoration: TextDecoration.underline,
                      height: 1.2,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                AppButton(
                  buttonText: "Tiếp tục",
                  onPressedFunction: _controller.login,
                ),

                //Button chưa có tài khoản, đăng ký
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Chưa có tài khoản?',
                        style: CustomTextStyle.p3(AppColors.blacktext)
                            .copyWith(height: 1.2),
                      ),
                      TextButton(
                        onPressed: _controller.navigateToSignUpScreen,
                        child: Text(
                          'Đăng ký',
                          style: CustomTextStyle.p3bold(AppColors.primary)
                              .copyWith(
                            decoration: TextDecoration.underline,
                            height: 1.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
