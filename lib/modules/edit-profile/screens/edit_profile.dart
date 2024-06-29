import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moonair/assets/icons/app_icons_icons.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/core/app_themes.dart';
import 'package:moonair/data/services/data_center.dart';
import 'package:moonair/global_widgets/button.dart';
import 'package:moonair/modules/edit-profile/widgets/CheckBox.dart';
import 'package:moonair/modules/edit-profile/widgets/UserProfileForm.dart';
import '../edit_profile_controller.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  final EditProfileController controller = Get.put(EditProfileController());

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
              margin: EdgeInsets.only(left: 3.0, bottom: 137.0),
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
              UserPro5FormWidget(),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: Obx(() => Row(children: [
                        CheckBoxWidget(
                          text: "Nam",
                          isChecked: controller.gender.value == 'male',
                          onChanged: (value) => controller.setGender('male'),
                        ),
                        SizedBox(width: 100),
                        CheckBoxWidget(
                          text: "Nữ",
                          isChecked: controller.gender.value == 'female',
                          onChanged: (value) => controller.setGender('female'),
                        )
                      ]))),
              SizedBox(height: 30),
              AppButton(
                  buttonText: 'Lưu thông tin',
                  onPressedFunction: () async {
                    try {
                      controller.saveProfile();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          "Cập nhật thông tin thành công",
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: AppColors.primary,
                      ));
                      Get.back();
                    } catch (error) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          "Đã xảy ra lỗi, vui lòng thử lại",
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.redAccent,
                      ));
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
