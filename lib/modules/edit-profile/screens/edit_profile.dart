import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moonair/assets/icons/app_icons_icons.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/core/app_themes.dart';
import 'package:moonair/data/services/data_center.dart';
import 'package:moonair/global_widgets/button.dart';
import 'package:moonair/modules/edit-profile/widgets/CheckBox.dart';
import 'package:moonair/modules/edit-profile/widgets/UserProfileForm.dart';

class EditProfile extends StatelessWidget {
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

  EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              margin: EdgeInsets.only(
                  left: 3.0,
                  bottom: 137.0), // Điều chỉnh margin trái cho nút leading
              child: IconButton(
                iconSize: 40,
                icon: Icon(AppIcons.left_square_2, color: AppColors.white),
                onPressed: () {
                  Get.back();
                },
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
                    icon: const Icon(
                      Icons.file_upload_outlined,
                      color: AppColors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  DataCenter.user!.name,
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
              AppButton(buttonText: 'Lưu thông tin', onPressedFunction: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
