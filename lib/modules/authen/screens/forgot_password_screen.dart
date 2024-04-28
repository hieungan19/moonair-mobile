import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/core/app_themes.dart';
import 'package:moonair/global_widgets/GradientContainer.dart';
import 'package:moonair/global_widgets/button.dart';
import 'package:moonair/global_widgets/text_field.dart';
import 'package:moonair/modules/authen/authen_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final AuthenController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const Center(
            child: GradientContainer([
          AppColors.background,
          AppColors.secondary,
        ])),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
                  child: Image.asset('lib/assets/logo/logo_big_2.png')),
              Text(
                'QUÊN MẬT KHẨU',
                style: CustomTextStyle.h2(AppColors.primary),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 280, 5),
                child: Text('Email', style: CustomTextStyle.p1(Colors.black)),
              ),
              MyTextField(
                  controller: _controller.email,
                  hintText: 'Nhập email',
                  obscureText: false),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 220, 5),
                child: Text('Mã xác nhận',
                    style: CustomTextStyle.p1(Colors.black)),
              ),
              Stack(
                children: <Widget>[
                  Expanded(
                    child: MyTextField(
                      controller: _controller.code,
                      hintText: 'Nhập mã',
                      obscureText: false,
                    ),
                  ),
                  Align(
                      heightFactor: 1.1,
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20, top: 5),
                        child: ElevatedButton(
                            onPressed: _controller.sendResetPassword,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors
                                  .transparent, // Set button color to transparent
                              elevation: 0, // Remove button shadow
                            ),
                            child: const Text('Gửi mã',
                                style: TextStyle(color: AppColors.primary))),
                      )),
                ],
              ),
              const SizedBox(height: 100),
              AppButton(
                onPressedFunction: _controller.checkResetPasswordCode,
                buttonText: 'Tiếp theo',
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
