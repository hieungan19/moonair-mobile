import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moonair/core/app_themes.dart';
import 'package:moonair/core/app_colors.dart';

class DropDownBtn extends StatefulWidget {
  final TextEditingController controller; // Đảm bảo kiểu dữ liệu rõ ràng

  const DropDownBtn({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<DropDownBtn> createState() => _DropDownBtnState();
}

class _DropDownBtnState extends State<DropDownBtn> {
  String? valueChoose;

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
  void initState() {
    super.initState();
    // Gán giá trị ban đầu cho valueChoose và controller
    valueChoose = listItem[0];
    widget.controller.text = valueChoose!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
        child: DropdownButtonFormField<String>(
          menuMaxHeight: 200,
          value: valueChoose,
          hint: const Text("Nhập quốc tịch"),
          disabledHint: const Text("Nhập quốc tịch"),
          onChanged: (newValue) {
            setState(() {
              valueChoose = newValue;
              widget.controller.text = newValue!;
            });
          },
          items: listItem
              .map((valueItem) => DropdownMenuItem(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(valueItem,
                        style: CustomTextStyle.p2(AppColors.blacktext)),
                    value: valueItem,
                  ))
              .toList(),
          isExpanded: true,
          isDense: false,
          icon: const Icon(Icons.arrow_drop_down_outlined),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
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
          ),
        ));
  }
}
