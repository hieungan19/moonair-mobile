import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/global_widgets/button.dart';
import 'package:moonair/modules/history/history_controller.dart';
import 'package:moonair/routes/app_route.dart';

import '../../../../core/app_themes.dart';

class PopUpCancelTicket extends StatelessWidget {
  final String id;
  PopUpCancelTicket({super.key, required this.id});
  final HistoryController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
            height: 200,
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
                  child: Image.asset(
                    'lib/assets/logo/sc_waiting.png',
                    width: 80,
                    height: 80,
                  ),
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
                        "Xác nhận hủy vé.",
                        style: CustomTextStyle.h3(AppColors.blacktext),
                      )
                    ]),
                AppButton(
                  onPressedFunction: () {
                    _controller.cancelOneTicket(context: context, id: id);
                  },
                  buttonText: 'Hủy vé',
                ),
              ],
            )));
  }
}
