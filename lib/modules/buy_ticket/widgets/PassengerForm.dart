import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Để sử dụng DateFormat
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/modules/buy_ticket/buy_ticket_controller.dart';

import '../../../core/app_themes.dart';
import '../../../global_widgets/text_field.dart';

class PassengerFormWidget extends StatefulWidget {
  final int seat;
  PassengerFormWidget({Key? key, required this.seat}) : super(key: key);

  @override
  _PassengerFormWidgetState createState() => _PassengerFormWidgetState();
}

class _PassengerFormWidgetState extends State<PassengerFormWidget> {
  final BuyTicketController _controller = Get.find();

  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Ngày mặc định là ngày hiện tại
      firstDate: DateTime(1900), // Ngày bắt đầu
      lastDate: DateTime
          .now(), // Ngày kết thúc (có thể là ngày hiện tại hoặc một ngày trong tương lai)
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _controller.dateofBirthController.value.text =
            DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 16),
          child: Text(
            'Ghế ${widget.seat}',
            style: CustomTextStyle.h3(AppColors.blacktext),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24, bottom: 5),
          child: Text(
            'Tên',
            style: CustomTextStyle.p2(AppColors.blacktext),
          ),
        ),
        SizedBox(
          height: 50,
          child: MyTextField(
            controller: _controller.usernameController.value,
            hintText: 'Nhập họ tên',
            obscureText: false,
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(left: 24, bottom: 5),
          child: Text(
            'Số điện thoại',
            style: CustomTextStyle.p2(AppColors.blacktext),
          ),
        ),
        SizedBox(
          height: 50,
          child: MyTextField(
            controller: _controller.phonenumberController.value,
            hintText: 'Nhập số điện thoại',
            obscureText: false,
          ),
        ),
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
                controller: _controller.dateofBirthController.value,
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
        const SizedBox(height: 15),
      ],
    );
  }
}
