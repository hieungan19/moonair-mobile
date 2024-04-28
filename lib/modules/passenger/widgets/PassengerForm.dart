// passenger_form_widget.dart
import 'package:flutter/material.dart';
import '../../../global_widgets/text_field.dart';
import 'package:moonair/core/app_colors.dart';
import '../../../core/app_themes.dart';
import '../../../modules/passenger/widgets/DropdownButton.dart';

class PassengerFormWidget extends StatelessWidget {
  PassengerFormWidget({super.key});
  final usernameController = TextEditingController();
  final phonenumberController = TextEditingController();
  final dateofBirthController = TextEditingController();
  final passportIDController = TextEditingController();
  final nationController = TextEditingController();
  int _groupValue = 0;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 16),
          child: Text(
            'Hành khách 1',
            style: CustomTextStyle.h3(AppColors.blacktext),
          )),
      Padding(
          padding: const EdgeInsets.only(left: 24, bottom: 5),
          child: Text(
            'Tên',
            style: CustomTextStyle.p2(AppColors.blacktext),
          )),
      SizedBox(
          height: 50,
          child: MyTextField(
            controller: usernameController,
            hintText: 'Nhập họ tên',
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
            controller: phonenumberController,
            hintText: 'Nhập số điện thoại',
            obscureText: false,
          )),
      const SizedBox(height: 15),
      Padding(
          padding: const EdgeInsets.only(left: 24, bottom: 5),
          child: Text(
            'Ngày sinh',
            style: CustomTextStyle.p2(AppColors.blacktext),
          )),
      SizedBox(
          height: 50,
          child: MyTextField(
            controller: dateofBirthController,
            hintText: 'Nhập ngày sinh',
            sufficIcon: const Icon(
              Icons.calendar_today_outlined,
              color: AppColors.grey2,
            ),
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
            controller: passportIDController,
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
            controller: nationController,
          )),
      const SizedBox(height: 15),
    ]);
  }
}
