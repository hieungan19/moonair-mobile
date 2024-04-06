import 'package:flutter/material.dart';
import 'package:moonair/global_widgets/app_input.dart';
import 'package:moonair/global_widgets/logo_big.dart';
import 'package:moonair/global_widgets/logo_name.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: logo_name(),
      ),
    );
  }
}
