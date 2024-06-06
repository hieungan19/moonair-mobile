import 'package:flutter/material.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/core/app_themes.dart';

class CheckBoxWidget extends StatefulWidget {
  final String text;
  final double checkboxSize;
  final TextStyle textStyle;

  CheckBoxWidget({
    required this.text,
    this.checkboxSize = 20.0,
    this.textStyle = const TextStyle(),
  });

  @override
  _CheckBoxWidgetState createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool isChecked = false;

  void _toggleCheckbox(bool? value) {
    setState(() {
      isChecked = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Transform.scale(
          scale: widget.checkboxSize / 20.0,
          child: Checkbox(
            value: isChecked,
            onChanged: _toggleCheckbox,
            activeColor: AppColors.primary,
          ),
        ),
        SizedBox(width: 8.0), // Add some space between checkbox and text
        Text(
          widget.text,
          style: CustomTextStyle.p2(AppColors.text),
        ),
      ],
    );
  }
}
