import 'package:flutter/material.dart';

import '../core/app_colors.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;

  const MyTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextField(
        controller: widget.controller,
        obscureText: _isHidden && widget.obscureText,
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
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: AppColors.info),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.obscureText == true
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _isHidden = !_isHidden;
                    });
                  },
                  child: _isHidden
                      ? const Icon(
                          Icons.visibility_off,
                          color: AppColors.grey2,
                        )
                      : const Icon(
                          Icons.remove_red_eye_outlined,
                          color: AppColors.grey2,
                        ),
                )
              : null,
        ),
      ),
    );
  }
}
