import 'package:flutter/material.dart';
import '../../../global_widgets/text_field.dart';
import 'package:moonair/core/app_colors.dart';
import '../../../core/app_themes.dart';
import '../../../modules/passenger/widgets/DropdownButton.dart';

class UserPro5FormWidget extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passportController;
  final TextEditingController idCardController;
  final TextEditingController countryController;
  const UserPro5FormWidget({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.passportController,
    required this.idCardController,
    required this.countryController,
    required this.emailController,
  });
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: const EdgeInsets.only(left: 24, bottom: 5),
          child: Text(
            'Tên',
            style: CustomTextStyle.p2(AppColors.blacktext),
          )),
      SizedBox(
          height: 50,
          child: MyTextField(
            controller: nameController,
            hintText: 'Nguyễn Thanh Thư',
            obscureText: false,
          )),
      const SizedBox(height: 15),
      Padding(
          padding: const EdgeInsets.only(left: 24, bottom: 5),
          child: Text(
            'Số điện thoại',
            style: CustomTextStyle.p2(AppColors.blacktext),
          )),
      SizedBox(
          height: 50,
          child: MyTextField(
            controller: phoneController,
            hintText: 'Nhập số điện thoại',
            obscureText: false,
          )),
      const SizedBox(height: 15),
      Padding(
          padding: const EdgeInsets.only(left: 24, bottom: 5),
          child: Text(
            'Email',
            style: CustomTextStyle.p2(AppColors.blacktext),
          )),
      SizedBox(
          height: 50,
          child: MyTextField(
            controller: emailController,
            hintText: 'Nhập email',
            obscureText: false,
          )),
      const SizedBox(height: 15),
      Padding(
          padding: const EdgeInsets.only(left: 24, bottom: 5),
          child: Text(
            'Passport / Căn cước công dân',
            style: CustomTextStyle.p2(AppColors.blacktext),
          )),
      SizedBox(
          height: 50,
          child: MyTextField(
            controller: idCardController,
            hintText: 'Nhập passport hoặc căn cước công dân',
            obscureText: false,
          )),
      const SizedBox(height: 15),
      Padding(
          padding: const EdgeInsets.only(left: 24, bottom: 5),
          child: Text(
            'Quốc tịch',
            style: CustomTextStyle.p2(AppColors.blacktext),
          )),
      SizedBox(
          height: 50,
          child: DropDownBtn(
            controller: countryController,
          )),
      const SizedBox(height: 15),
    ]);
  }
}
