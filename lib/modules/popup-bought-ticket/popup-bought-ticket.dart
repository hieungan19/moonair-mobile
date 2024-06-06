import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moonair/core/app_colors.dart';
import '../../../core/app_themes.dart';
import 'package:moonair/global_widgets/button.dart';

void main() {
  runApp(Popup_Bought_Ticket());
}

class Popup_Bought_Ticket extends StatelessWidget {
  const Popup_Bought_Ticket({super.key});
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
            height: 430,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.gray400,
                  offset: const Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 0.0,
                ),
                BoxShadow(
                  color: AppColors.white,
                  offset: const Offset(0.0, 0.0),
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
                      Icon(
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
                  onPressedFunction: () {},
                  buttonText: 'Xem vé',
                ),
                AppButton(
                  onPressedFunction: () {},
                  buttonText: 'Trang chủ',
                ),
              ],
            )));
  }
}
