import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/core/app_themes.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.background, AppColors.secondary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(children: [
              Center(child: Padding(
                padding: EdgeInsets.only(top: 27), 
                child: Image.asset('lib/assets/logo/sc_waiting.png',scale: 1.9)
                )),
                Center(
                  child: SizedBox(
                    width: 350,
                    height: 350,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ]),
              Text(
                'Dữ liệu đang được tải...',
                style: CustomTextStyle.h2(AppColors.primary)
                          .copyWith(height: 1.8),
              ),
            ]),
          ),
      ),
    );
  }
}




