import 'package:flutter/material.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/core/app_themes.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
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
                  Center(
                      child: Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Image.asset('lib/assets/logo/sc_waiting.png',
                              scale: 4))),
                  const Center(
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ]),
                const SizedBox(height: 60),
                Text(
                  'Dữ liệu đang được tải...',
                  style: CustomTextStyle.h3(AppColors.primary),
                ),
              ]),
        ),
      ),
    );
  }
}
