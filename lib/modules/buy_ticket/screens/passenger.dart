import 'package:flutter/material.dart';
import 'package:moonair/assets/icons/app_icons_icons.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/core/app_themes.dart';
import 'package:moonair/global_widgets/button.dart';
import 'package:moonair/modules/buy_ticket/widgets/PassengerForm.dart';

class Passenger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Text(
            'Thông tin hành khách',
            style: CustomTextStyle.h3(AppColors.blacktext),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              iconSize: 35,
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              icon: Icon(AppIcons.refresh_1),
              onPressed: () {},
            )
          ],
          leading: IconButton(
            onPressed: () {},
            icon: IconButton(
              iconSize: 40,
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
              icon: Icon(AppIcons.left_square_2),
              onPressed: () {},
            ),
          ),
        ),
        body: Center(
            child: ListView(children: [
          SizedBox(height: 20),
          PassengerFormWidget(),
          SizedBox(height: 20),
          PassengerFormWidget(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey2, width: 0.2),
            ),
            child: AppButton(buttonText: 'Tiếp theo', onPressedFunction: () {}),
          )
        ] // Sử dụng widget PassengerFormWidget
                )));
  }
}
