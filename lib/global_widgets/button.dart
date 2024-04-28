import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/app_themes.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.buttonText,
      required this.onPressedFunction,
      this.color = AppColors.primary,
      this.textColor = AppColors.whitetext,
      this.ignore = false});
  final String buttonText;
  final Color color;
  final Color textColor;
  final VoidCallback onPressedFunction;
  final bool ignore;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: IgnorePointer(
        ignoring: ignore,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: (ignore ? AppColors.grey2 : color),
                side: color == AppColors.background
                    ? const BorderSide(width: 0.3, color: AppColors.primary)
                    : BorderSide.none,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: onPressedFunction,
            child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Text(buttonText,
                        style: CustomTextStyle.button(textColor))))),
      ),
    ));
  }
}
