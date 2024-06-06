import 'package:flutter/material.dart';
import '../../../core/app_themes.dart';
import '../../../core/app_colors.dart';
import '../../../global_widgets/button.dart';
import '../widgets/booking_widget.dart';
import '../widgets/booked_widget.dart';

class MyBookedDetail extends StatefulWidget {
  const MyBookedDetail({super.key});

  @override
  State<MyBookedDetail> createState() => _MyBookedDetailState();
}

class _MyBookedDetailState extends State<MyBookedDetail> {
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Text(
                        'Chi tiết đặt vé',
                        style: CustomTextStyle.h3(AppColors.whitetext),
                        textAlign: TextAlign.center,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'lib/assets/icons/share.png',
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BookedDetail(detail: -1),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10),
                    child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(0, 57, 59, 59)
                                  .withOpacity(0.5), //color of shadow
                              spreadRadius: 2, //spread radius
                              blurRadius: 10, // blur radius
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Image.asset(
                          'lib/assets/images/code.png',
                        )),
                  ),
                  AppButton(buttonText: 'Tải mã vé', onPressedFunction: () {}),
                  AppButton(buttonText: 'Hủy vé', onPressedFunction: () {}),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ]));
  }
}
