import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/core/app_themes.dart';
import 'package:moonair/global_widgets/GradientContainer.dart';
import 'package:moonair/global_widgets/button.dart';
import 'package:moonair/global_widgets/text_field.dart';


class PasswordResetScreen1 extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController verifiController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: GradientContainer([
              AppColors.background, 
              AppColors.secondary,
            ])),
          Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
                child: Image.asset('lib/assets/logo/logo_big_2.png')
                ),
              Text(
                'ĐẶT LẠI MẬT KHẨU',
                style: CustomTextStyle.h2(AppColors.primary),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 280, 5),
                child: Text('Email',
                style: CustomTextStyle.p1(Colors.black)),
              ),
              MyTextField(controller: emailController, hintText: 'Nhập email', obscureText: false),
              Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 220, 5),
                    child: Text('Mã xác nhận',
                    style: CustomTextStyle.p1(Colors.black)),
                  ),
              Stack(
                children: <Widget>[ 
                  Expanded(
                    child: MyTextField(
                      controller: verifiController,
                      hintText: 'Nhập mã',
                      obscureText: false,
                    ),
                  ),
                  Align(
                    heightFactor: 1.1,
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Gửi mã', style: TextStyle(color: AppColors.primary)),
                        style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent, // Set button color to transparent
                        elevation: 0, // Remove button shadow   
                      )),
                    )
                  ),
                ],
              ),
              SizedBox(height: 100),
              AppButton(
                onPressedFunction: () {},
                buttonText: 'Tiếp theo',
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class PasswordResetScreen2 extends StatelessWidget {
  TextEditingController passwordController1 = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Center(
              child: GradientContainer([
                AppColors.background, 
                AppColors.secondary,
              ])),
            Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
                  child: Image.asset('lib/assets/logo/logo_big_2.png')),
                Text(
                  'ĐẶT LẠI MẬT KHẨU',
                  style: CustomTextStyle.h2(AppColors.primary),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 220, 5),
                  child: Text('Mật khẩu mới',
                  style: CustomTextStyle.p1(Colors.black)),
                ),
                MyTextField(controller: passwordController1, hintText: 'Mật khẩu', obscureText: true),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 180, 5),
                  child: Text('Nhập lại mật khẩu',
                  style: CustomTextStyle.p1(Colors.black)),
                ),
                MyTextField(controller: passwordController2, hintText: 'Mật khẩu', obscureText: true),
                SizedBox(height: 100),
                AppButton(
                  onPressedFunction: () {},
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