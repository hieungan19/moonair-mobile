import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';

class HomeTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final ImageIcon? prefixIcon;
  final ImageIcon? sufficIcon;

  const HomeTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.prefixIcon, //icon ở đầu
    this.sufficIcon, //icon ở đuôi
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColors.info),
          prefixIcon: prefixIcon,
          suffixIcon: sufficIcon,
        ),
      ),
    );
  }
}
