import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/global_widgets/GradientContainer.dart';
import 'package:moonair/modules/authen/authen_controller.dart';
import '../../../global_widgets/button.dart';
import '../../../core/app_themes.dart';

class WelcomScreen extends StatelessWidget {
  WelcomScreen({super.key});
  final AuthenController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        // Background gradient
        const Center(
            child: GradientContainer([
          AppColors.background,
          AppColors.secondary,
        ])),

        Positioned.fill(
          child: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: Image.asset(
                  'lib/assets/logo/logo_name.png',
                ),
              ),

              Text(
                'An easy way to start travelling!',
                style: CustomTextStyle.h1(AppColors.primary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              Text(
                  'See where you can travel to right now and find the best deals',
                  style: CustomTextStyle.p1(AppColors.blacktext),
                  textAlign: TextAlign.center),
              const SizedBox(height: 30),

              //Button
              AppButton(
                  buttonText: "Let's fly!",
                  onPressedFunction: _controller.navigateToLoginScreen),

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
                        style:
                            CustomTextStyle.p3bold(AppColors.primary).copyWith(
                          decoration: TextDecoration.underline,
                          height: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              //Ảnh máy bay
              Image.asset(
                'lib/assets/images/airplane.png',
                width: 390,
                alignment: Alignment.center,
              ),
            ]),
          ),
        )
      ]),
    );
  }
}
