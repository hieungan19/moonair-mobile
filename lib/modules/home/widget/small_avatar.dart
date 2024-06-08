import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String? avtimage;
  final double size;

  const Avatar({
    super.key,
    required this.avtimage,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(avtimage ?? "lib/assets/images/avatar.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
