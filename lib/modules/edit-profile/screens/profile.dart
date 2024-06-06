import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:moonair/core/app_themes.dart';
import 'package:moonair/modules/edit-profile/widgets/CheckBox.dart';
import 'package:moonair/modules/edit-profile/widgets/UserProfileForm.dart';
import 'package:moonair/assets/icons/app_icons_icons.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/global_widgets/button.dart';
import 'package:moonair/global_widgets/bottom_navbar.dart';

void main() {
  runApp(UserProfileScreen());
}

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(240.0),
        child: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          toolbarHeight: 240,
          elevation: 15,
          backgroundColor: AppColors.primary,
          leading: Container(
              margin: EdgeInsets.only(
                  left: 3.0,
                  bottom: 137.0), // Điều chỉnh margin trái cho nút leading
              child: IconButton(
                iconSize: 40,
                icon: Icon(AppIcons.left_square_2, color: AppColors.white),
                onPressed: () {},
              )),
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: AppColors.primary,
                  backgroundImage: AssetImage('lib/assets/images/avatar.jpg'),
                ),
                SizedBox(height: 8),
                Text(
                  "Jennifer Lawrence",
                  style: CustomTextStyle.p2(AppColors.white),
                ),
                SizedBox(height: 27),
              ],
            ),
          ),
          title: Container(
            margin: EdgeInsets.only(bottom: 137.0),
            child: Text(
              'Chỉnh sửa hồ sơ',
              style: CustomTextStyle.h3(AppColors.white),
            ),
          ),
          centerTitle: true,
          titleSpacing: 0,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Chỉnh sửa hồ sơ',
                  style: CustomTextStyle.p1(AppColors.text)),
              onTap: () {
                // Navigate to edit profile screen
              },
            ),
            ListTile(
              leading: Icon(Icons.policy),
              title: Text('Chính sách sân bay',
                  style: CustomTextStyle.p1(AppColors.text)),
              onTap: () {
                // Navigate to airport policy screen
              },
            ),
            SizedBox(height: 250),
            AppButton(buttonText: 'Lưu thông tin', onPressedFunction: () {}),
          ],
        )),
      ),
      bottomNavigationBar: const NavBar(),
    ));
  }
}
