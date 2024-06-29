import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/modules/authen/authen_controller.dart';

import '../../../core/app_themes.dart';
import '../../../global_widgets/button.dart';
import '../../../global_widgets/text_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final AuthenController _controller = Get.put(AuthenController());

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
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Center(
                    child: Image.asset(
                  'lib/assets/logo/Logo.png',
                  height: 110,
                )),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Text(
                  'ĐĂNG KÝ',
                  style: CustomTextStyle.h2(AppColors.primary),
                  textAlign: TextAlign.left,
                ),
              ),

              const SizedBox(height: 5),

              //Họ tên

              Padding(
                  padding: const EdgeInsets.only(left: 24, bottom: 5),
                  child: Text(
                    'Họ và tên',
                    style: CustomTextStyle.p2(AppColors.blacktext),
                  )),

              SizedBox(
                  height: 50,
                  child: MyTextField(
                    controller: _controller.name,
                    hintText: 'Nhập họ tên',
                    obscureText: false,
                  )),
              const SizedBox(height: 10),

              //Nhập email

              Padding(
                  padding: const EdgeInsets.only(left: 24, bottom: 5),
                  child: Text(
                    'Email',
                    style: CustomTextStyle.p2(AppColors.blacktext),
                  )),

              SizedBox(
                  height: 50,
                  child: MyTextField(
                    controller: _controller.email,
                    hintText: 'Nhập email',
                    obscureText: false,
                  )),
              const SizedBox(height: 10),

              //Nhập số điện thoại

              Padding(
                  padding: const EdgeInsets.only(left: 24, bottom: 5),
                  child: Text(
                    'Số điện thoại',
                    style: CustomTextStyle.p2(AppColors.blacktext),
                  )),

              SizedBox(
                  height: 50,
                  child: MyTextField(
                    controller: _controller.phoneNumber,
                    hintText: 'Nhập số điện thoại',
                    obscureText: false,
                  )),
              const SizedBox(height: 10),

              //Text Field nhập password

              Padding(
                  padding: const EdgeInsets.only(left: 24, bottom: 5),
                  child: Text(
                    'Mật khẩu',
                    style: CustomTextStyle.p2(AppColors.blacktext),
                  )),

              SizedBox(
                  height: 50,
                  child: MyTextField(
                    controller: _controller.password,
                    hintText: 'Nhập mật khẩu',
                    obscureText: true,
                  )),
              const SizedBox(height: 10),

              Padding(
                  padding: const EdgeInsets.only(left: 24, bottom: 5),
                  child: Text(
                    'Nhập lại mật khẩu',
                    style: CustomTextStyle.p2(AppColors.blacktext),
                  )),

              SizedBox(
                  height: 50,
                  child: MyTextField(
                    controller: _controller.confirmPassword,
                    hintText: 'Nhập lại mật khẩu',
                    obscureText: true,
                  )),
              const SizedBox(height: 10),

              //Nhập quốc gia

              Padding(
                  padding: const EdgeInsets.only(left: 24, bottom: 5),
                  child: Text(
                    'Giới tính',
                    style: CustomTextStyle.p2(AppColors.blacktext),
                  )),

              //radio button gender

              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Obx(
                        () => RadioListTile(
                          title: Text('Nam',
                              style: CustomTextStyle.p2(AppColors.blacktext)),
                          value: 'male',
                          groupValue: _controller.selectedGender.value,
                          onChanged: (value) {
                            _controller.selectGender(value!);
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Obx(
                        () => RadioListTile(
                          title: Text(
                            'Nữ',
                            style: CustomTextStyle.p2(AppColors.blacktext),
                          ),
                          value: 'female',
                          groupValue: _controller.selectedGender.value,
                          onChanged: (value) {
                            _controller.selectGender(value!);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              AppButton(
                buttonText: "Tạo tài khoản",
                onPressedFunction: _controller.signUp,
              ),

              //Button chưa có tài khoản, đăng ký
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Đã có tài khoản?',
                      style: CustomTextStyle.p3(AppColors.blacktext)
                          .copyWith(height: 1.2),
                    ),
                    TextButton(
                      onPressed: _controller.navigateToLoginScreen,
                      child: Text(
                        'Đăng nhập',
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
            ],
          ),
        ]),
      ),
    ));
  }
}
