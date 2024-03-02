import 'package:flutter/material.dart';
import 'package:moonair/global_widgets/app_input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AppInput(),
      ),
    );
  }
}
