import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackbar({title, content, color}) {
  Get.snackbar(
    title,
    content,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: color,
    borderRadius: 20,
    margin: const EdgeInsets.all(8),
    colorText: Colors.white,
    duration: const Duration(seconds: 1),
    isDismissible: true,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}
