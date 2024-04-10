import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/core/app_themes.dart';
import 'package:moonair/global_widgets/GradientContainer.dart';
import 'package:moonair/global_widgets/button.dart';


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
                child: Image.asset('lib/assets/logo/logo_big_2.png')),
              Text(
                'ĐẶT LẠI MẬT KHẨU',
                style: CustomTextStyle.h2(AppColors.primary),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Nhập email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8)),
                ),
              ),
              SizedBox(height: 20),
              Stack(
                children: <Widget>[ 
                  Expanded(
                    child: TextField(
                      controller: verifiController,
                      decoration: InputDecoration(
                        labelText: 'Mã xác nhận',
                        hintText: 'Nhập mã',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      ),
                      
                    ),
                  ),
                  Align(
                    heightFactor: 1.5,
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Gửi mã', style: TextStyle(color: AppColors.primary)),
                      style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent, // Set button color to transparent
                      elevation: 0, // Remove button shadow   
                    ))
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
                child: Image.asset('lib/assets/logo/logo_big_2.png')),
              Text(
                'ĐẶT LẠI MẬT KHẨU',
                style: CustomTextStyle.h2(AppColors.primary),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Mật khẩu mới',
                  suffixIcon: IconButton(onPressed:  () {}, icon: Icon(Icons.visibility)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Nhập lại mật khẩu',
                  suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.visibility)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 108),
              AppButton(
                onPressedFunction: () {},
                buttonText: 'Đặt lại',
              ),
            ],
          ),
        ),
      ]),
    );
  }
}