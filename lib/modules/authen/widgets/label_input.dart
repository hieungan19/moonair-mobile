import 'package:flutter/material.dart';
import '../../../global_widgets/text_field.dart';
import '../../../core/app_colors.dart';
import '../../../core/app_themes.dart';

class LabelAndInput extends StatelessWidget {
  final controller;
  final String label;
  final Color textColor;
  final String hintText;
  final bool obscureText;

  const LabelAndInput({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    required this.obscureText,
    this.textColor = AppColors.blacktext,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 24, bottom: 5),
            child: Text(label, style: CustomTextStyle.p2(textColor))),
        SizedBox(
          height: 50,
          child: MyTextField(
            controller: controller,
            hintText: hintText,
            obscureText: obscureText,
          ),
        ),
        const SizedBox(height: 10),
      ],
    ));
  }
}
