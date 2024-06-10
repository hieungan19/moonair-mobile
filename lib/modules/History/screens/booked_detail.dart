import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moonair/data/models/flightInHistory.dart';
import 'package:moonair/modules/history/history_controller.dart';
import 'package:moonair/modules/history/widgets/pop_up_cancel_ticket.dart';

import '../../../core/app_colors.dart';
import '../../../core/app_themes.dart';
import '../../../global_widgets/button.dart';
import '../widgets/booked_widget.dart';

//chi tiết đặt vé sau khi thanh toán

class MyBookedDetail extends StatefulWidget {
  const MyBookedDetail({super.key});

  @override
  State<MyBookedDetail> createState() => _MyBookedDetailState();
}

class _MyBookedDetailState extends State<MyBookedDetail> {
  HistoryController _controller = Get.find();
  final BoughtTicket ticket = Get.arguments;
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
                          Get.back();
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
                  BookedDetail(
                    ticket: ticket,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10),
                    child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width / 2,
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
                        child: Image.network(
                          'https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=${ticket.id}',
                          height: 50,
                          width: MediaQuery.of(context).size.width / 3,
                        )),
                  ),
                  ticket.status == true
                      ? AppButton(
                          buttonText: 'Hủy vé',
                          onPressedFunction: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return PopUpCancelTicket(
                                  id: ticket.id,
                                );
                              },
                            );
                          })
                      : SizedBox(),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ]));
  }
}
