import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../global_widgets/text_field.dart';
import 'package:moonair/core/app_colors.dart';
import '../../../core/app_themes.dart';

class DropDownBtn extends StatefulWidget {
  final controller;
  const DropDownBtn({
    super.key,
    required this.controller,
  });

  @override
  State<DropDownBtn> createState() => DropDownBtn_State();
}

class DropDownBtn_State extends State<DropDownBtn> {
  DropDownBtn_State() {
    valueChoose = listItem[0];
  }
  String? valueChoose = "";
  final listItem = [
    "Việt Nam",
    "Nga",
    "Canada",
    "Mỹ",
    "Trung Quốc",
    "Hàn Quốc",
    "Ấn Độ",
    "Nhật Bản",
    "Thái Lan"
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: DropdownButtonFormField<String>(
            value: valueChoose,
            hint: Text("Nhập quốc tịch"),
            disabledHint: Text("Nhập quốc tịch"),
            onChanged: (newValue) {
              setState(() {
                valueChoose = newValue as String;
              });
            },
            items: listItem
                .map((valueItem) => DropdownMenuItem(
                      child: Text(valueItem),
                      value: valueItem,
                    ))
                .toList(),
            icon: const Icon(Icons.arrow_drop_down_outlined),
            decoration: InputDecoration(
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
            )));
  }
}
