import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/core/app_themes.dart';
import 'package:moonair/global_widgets/GradientContainer.dart';
import 'package:moonair/global_widgets/button.dart';
import 'package:moonair/global_widgets/text_field.dart';
import 'package:moonair/modules/authen/authen_controller.dart';

class PasswordResetScreen extends StatelessWidget {
  final AuthenController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
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
                  'ĐẶT LẠI MẬT KHẨU',
                  style: CustomTextStyle.h2(AppColors.primary),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 220, 5),
                  child: Text('Mật khẩu mới',
                      style: CustomTextStyle.p1(Colors.black)),
                ),
                MyTextField(
                    controller: _controller.password,
                    hintText: 'Mật khẩu',
                    obscureText: true),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 180, 5),
                  child: Text('Nhập lại mật khẩu',
                      style: CustomTextStyle.p1(Colors.black)),
                ),
                MyTextField(
                    controller: _controller.confirmPassword,
                    hintText: 'Mật khẩu',
                    obscureText: true),
                const SizedBox(height: 100),
                AppButton(
                  onPressedFunction: _controller.resetPassword,
                  buttonText: 'Đặt lại',
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
