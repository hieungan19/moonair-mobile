import 'package:flutter/material.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/global_widgets/GradientContainer.dart';
import '../../../global_widgets/button.dart';
import '../../../core/app_themes.dart';
import '../../../global_widgets/text_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phonenumberController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatpasswordController = TextEditingController();
  final countryController = TextEditingController();
  int _groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Center(
            child: GradientContainer(
              [
                AppColors.background,
                AppColors.secondary,
              ],
            ),
          ),
          Positioned.fill(
            child: Center(
              child: ListView(children: [
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
                          controller: usernameController,
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
                          controller: emailController,
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
                          controller: phonenumberController,
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
                          controller: passwordController,
                          hintText: 'Nhập mật khẩu',
                          obscureText: true,
                          sufficIcon: const Icon(
                            Icons.remove_red_eye_outlined,
                            color: AppColors.grey2,
                          )),
                    ),
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
                          controller: repeatpasswordController,
                          hintText: 'Nhập mật khẩu',
                          obscureText: false,
                        )),
                    const SizedBox(height: 10),

                    //Nhập quốc gia

                    Padding(
                        padding: const EdgeInsets.only(left: 24, bottom: 5),
                        child: Text(
                          'Quốc gia',
                          style: CustomTextStyle.p2(AppColors.blacktext),
                        )),

                    SizedBox(
                        height: 50,
                        child: MyTextField(
                          controller: countryController,
                          hintText: 'Chọn quốc gia',
                          obscureText: false,
                          sufficIcon: const Icon(Icons.arrow_drop_down,
                              color: AppColors.primary),
                        )),
                    const SizedBox(height: 10),

                    //radio button nam nu

                    // SizedBox(
                    //   width: 200,
                    //   height: 30,
                    //   child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       mainAxisSize: MainAxisSize.min,
                    //       children: [
                    //         Expanded(
                    //           child: CustomRadioButton(
                    //               label: 'Nam',
                    //               textColor: AppColors.blacktext,
                    //               value: 0,
                    //               groupValue: _groupValue,
                    //               onChanged: () {}),
                    //         ),
                    //         const SizedBox(width: 70),
                    //         Expanded(
                    //           child: CustomRadioButton(
                    //               label: 'Nữ',
                    //               textColor: AppColors.blacktext,
                    //               value: 1,
                    //               groupValue: _groupValue,
                    //               onChanged: () {}),
                    //         )
                    //       ]),
                    // ),

                    const SizedBox(height: 10),

                    AppButton(
                      buttonText: "Tạo tài khoản",
                      onPressedFunction: () {},
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
                            onPressed: () {
                              // Xử lý khi nút "Đăng ký" được nhấn
                            },
                            child: Text(
                              'Đăng nhập',
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
              ]),
            ),
          )
        ],
      ),
    );
  }
}
