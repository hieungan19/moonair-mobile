import 'package:flutter/material.dart';
import '../../../core/app_themes.dart';
import '../../../core/app_colors.dart';
import '../widgets/booking_widget.dart';
import '../widgets/booked_widget.dart';

// Thông tin chi tiết vé
class MyBookedInfo extends StatefulWidget {
  const MyBookedInfo({super.key});

  @override
  State<MyBookedInfo> createState() => _MyBookedInfoState();
}

class _MyBookedInfoState extends State<MyBookedInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: Column(children: [
          Container(
            height: 120,
            width: MediaQuery.of(context).size.width,
            color: AppColors.primary,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  const SizedBox(height: 60), // Space for the status bar
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context); // Go back to previous screen
                        },
                        icon: Image.asset(
                          'lib/assets/icons/back.png',
                          color: AppColors.white,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            'Thông tin vé',
                            style: CustomTextStyle.h3(AppColors.whitetext),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(width: 48),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              child: BookedDetail(detail: 1),
            ),
          ),
        ]));
  }
}
