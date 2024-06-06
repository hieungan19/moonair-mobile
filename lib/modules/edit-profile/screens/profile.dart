import 'package:flutter/material.dart';
import 'package:moonair/assets/icons/app_icons_icons.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/core/app_themes.dart';
import 'package:moonair/global_widgets/bottom_navbar.dart';
import 'package:moonair/global_widgets/button.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(240.0),
        child: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          toolbarHeight: 240,
          elevation: 15,
          backgroundColor: AppColors.primary,
          leading: Container(
              margin: const EdgeInsets.only(
                  left: 3.0,
                  bottom: 137.0), // Điều chỉnh margin trái cho nút leading
              child: IconButton(
                iconSize: 40,
                icon:
                    const Icon(AppIcons.left_square_2, color: AppColors.white),
                onPressed: () {},
              )),
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundColor: AppColors.primary,
                  backgroundImage: AssetImage('lib/assets/images/avatar.jpg'),
                ),
                const SizedBox(height: 8),
                Text(
                  "Jennifer Lawrence",
                  style: CustomTextStyle.p2(AppColors.white),
                ),
                const SizedBox(height: 27),
              ],
            ),
          ),
          title: Container(
            margin: const EdgeInsets.only(bottom: 137.0),
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
            AppButton(buttonText: 'Đăng xuất', onPressedFunction: () {}),
          ],
        )),
      ),
      bottomNavigationBar: const NavBar(),
    ));
  }
}
