import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:moonair/modules/edit-profile/edit_profile_controller.dart';
import '../../../global_widgets/text_field.dart';
import 'package:moonair/core/app_colors.dart';
import '../../../core/app_themes.dart';
import 'DropdownButton.dart';

class UserPro5FormWidget extends StatelessWidget {
  EditProfileController _controller = Get.find();
  UserPro5FormWidget({
    super.key,
  });
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Ngày mặc định là ngày hiện tại
      firstDate: DateTime(1900), // Ngày bắt đầu
      lastDate: DateTime
          .now(), // Ngày kết thúc (có thể là ngày hiện tại hoặc một ngày trong tương lai)
    );
    if (picked != null && picked != _controller.dob) {
      _controller.dob.value = picked;
      _controller.dobText.value.text = DateFormat('dd/MM/yyyy').format(picked);
    }
  }

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
            controller: _controller.name.value,
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
            controller: _controller.phoneNumber.value,
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
            controller: _controller.email.value,
            hintText: 'Nhập email',
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
            controller: _controller.country.value,
          )),
      const SizedBox(height: 15),
      Padding(
        padding: const EdgeInsets.only(left: 24, bottom: 5),
        child: Text(
          'Ngày sinh',
          style: CustomTextStyle.p2(AppColors.blacktext),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: GestureDetector(
          onTap: () {
            _selectDate(context);
          },
          child: AbsorbPointer(
            child: TextFormField(
              controller: _controller.dobText.value,
              decoration: InputDecoration(
                hintText: 'Nhập ngày sinh',
                suffixIcon: const Icon(
                  Icons.calendar_today_outlined,
                  color: AppColors.grey2,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.grey2),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.primary),
                  borderRadius: BorderRadius.circular(10),
                ),
                fillColor: AppColors.white,
                filled: true,
                hintStyle: const TextStyle(color: AppColors.info),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
