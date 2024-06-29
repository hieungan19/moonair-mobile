import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/global_widgets/button.dart';
import 'package:moonair/routes/app_route.dart';

import '../../../../core/app_themes.dart';

class Popup_Bought_Ticket extends StatelessWidget {
  const Popup_Bought_Ticket({super.key});
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
            height: 430,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: AppColors.gray400,
                  offset: Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 0.0,
                ),
                BoxShadow(
                  color: AppColors.white,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ),
              ],
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child:
                      Image.asset('lib/assets/logo/sc_waiting.png', scale: 4),
                ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.check_circle_outline,
                        color: AppColors.secondary,
                        size: 40,
                        weight: 40,
                      ),
                      Text(
                        "Đặt vé thành công",
                        style: CustomTextStyle.h3(AppColors.blacktext),
                      )
                    ]),
                Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                    child: Text(
                      "Cảm ơn đã chọn dịch vụ của chúng tôi",
                      style: CustomTextStyle.p2(AppColors.blacktext),
                      textAlign: TextAlign.center,
                    )),
                AppButton(
                  onPressedFunction: () {
                    Get.toNamed(AppRoutes.base);
                  },
                  buttonText: 'Trang chủ',
                ),
              ],
            )));
  }
}
