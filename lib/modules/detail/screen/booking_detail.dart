import 'package:flutter/material.dart';
import '../../../core/app_themes.dart';
import '../../../core/app_colors.dart';
import '../widgets/booking_widget.dart';

class MyBookingDetail extends StatefulWidget {
  const MyBookingDetail({super.key});

  @override
  State<MyBookingDetail> createState() => _MyBookingDetailState();
}

class _MyBookingDetailState extends State<MyBookingDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: Column(children: [
          Container(
            height: 170,
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
                            'Chi tiết đặt vé',
                            style: CustomTextStyle.h3(AppColors.whitetext),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(width: 48),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Image.asset('lib/assets/icons/Slide_seat4.png'),
                ],
              ),
            ),
          ),
          const Flexible(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BookingDetail(),
                  BookingDetail(),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 5),
                        child: Text(
                          'Tổng cộng',
                          style: CustomTextStyle.p1(AppColors.blacktext),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          '4.200.000Đ',
                          style: CustomTextStyle.h3(AppColors.blacktext),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        backgroundColor: AppColors.primary,
                      ),
                      onPressed: () {
                        // Xử lý sự kiện khi nút được nhấn
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7),
                        child: Text('Thanh toán',
                            style: CustomTextStyle.h3(AppColors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
