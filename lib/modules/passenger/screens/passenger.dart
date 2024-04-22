import 'package:flutter/material.dart';
import 'package:moonair/core/app_themes.dart';
import 'package:moonair/modules/passenger/widgets/PassengerForm.dart';
import 'package:moonair/assets/icons/app_icons_icons.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/global_widgets/text_field.dart';

void main() {
  runApp(Passenger());
}

class Passenger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.white,
              title: Text(
                'Chọn chỗ ngồi',
                style: CustomTextStyle.h3(AppColors.blacktext),
              ),
              centerTitle: true,
              actions: <Widget>[
                IconButton(
                  iconSize: 35,
                  padding: const EdgeInsets.all(20.0),
                  icon: Icon(AppIcons.refresh_1),
                  onPressed: () {},
                )
              ],
              leading: IconButton(
                onPressed: () {},
                icon: IconButton(
                  iconSize: 40,
                  icon: Icon(AppIcons.left_square_2),
                  onPressed: () {},
                ),
              ),
            ),
            body: new Center(
                child: ListView(children: [
              SizedBox(height: 20),
              PassengerFormWidget(),
              SizedBox(height: 20),
              PassengerFormWidget(),
            ] // Sử dụng widget PassengerFormWidget
                    ))));
  }
}
