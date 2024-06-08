import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';
import '../../../core/app_themes.dart';

class IsTransitButton extends StatelessWidget {
  const IsTransitButton({
    super.key,
    required this.name,
    this.onTap,
    this.height = 40,
    this.width = 130,
    required this.prefixIcon, //icon ở đầu
    this.isSelected = false,
  });

  final void Function()? onTap;
  final String name;
  final double width;
  final double height;
  final ImageIcon prefixIcon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : AppColors.tint2,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: isSelected ? AppColors.primary : AppColors.primary,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              prefixIcon,
              const SizedBox(width: 5),
              Text(
                name,
                style: CustomTextStyle.p1(AppColors.blacktext).copyWith(
                  color: isSelected ? AppColors.whitetext : AppColors.primary,
                ),
              ),
            ],
          ),
        ));
  }
}
