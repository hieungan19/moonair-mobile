import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:moonair/core/app_themes.dart';
import 'package:moonair/modules/edit-profile/widgets/CheckBox.dart';
import 'package:moonair/modules/edit-profile/widgets/UserProfileForm.dart';
import 'package:moonair/assets/icons/app_icons_icons.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/global_widgets/button.dart';

void main() {
  runApp(Edit_profile());
}

class Edit_profile extends StatelessWidget {
  final TextEditingController nameController =
      TextEditingController(text: "Nguyễn Thanh Thư");
  final TextEditingController emailController =
      TextEditingController(text: "ABs@mail.com");
  final TextEditingController phoneController =
      TextEditingController(text: "0913128784");
  final TextEditingController passportController =
      TextEditingController(text: "Nguyễn Thanh Thư");
  final TextEditingController idCardController =
      TextEditingController(text: "Nguyễn Thanh Thư");
  final TextEditingController countryController =
      TextEditingController(text: "Nguyễn Thanh Thư");

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
                    child: IconButton(
                      iconSize: 35,
                      icon: Icon(
                        Icons.file_upload_outlined,
                        color: AppColors.white,
                      ),
                      onPressed: () {},
                    ),
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
                UserPro5FormWidget(
                  nameController: nameController,
                  emailController: emailController,
                  phoneController: phoneController,
                  passportController: passportController,
                  idCardController: idCardController,
                  countryController: countryController,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(children: [
                    CheckBoxWidget(
                      text: "Nam",
                    ),
                    SizedBox(width: 100),
                    CheckBoxWidget(
                      text: "Nữ",
                    )
                  ]),
                ),
                SizedBox(height: 30),
                AppButton(
                    buttonText: 'Lưu thông tin', onPressedFunction: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
