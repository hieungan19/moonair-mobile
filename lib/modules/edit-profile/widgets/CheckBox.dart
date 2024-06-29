import 'package:flutter/material.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/core/app_themes.dart';

class CheckBoxWidget extends StatelessWidget {
  final String text;
  final double checkboxSize;

  final bool isChecked;
  final ValueChanged<bool?> onChanged;

  CheckBoxWidget({
    required this.text,
    required this.isChecked,
    required this.onChanged,
    this.checkboxSize = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Transform.scale(
          scale: checkboxSize / 20.0,
          child: Checkbox(
            value: isChecked,
            onChanged: onChanged,
            activeColor: AppColors.primary,
          ),
        ),
        SizedBox(width: 8.0), // Add some space between checkbox and text
        Text(
          text,
          style: CustomTextStyle.p2(AppColors.text),
        ),
      ],
    );
  }
}
