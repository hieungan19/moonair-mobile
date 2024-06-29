import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/global_widgets/ticket.dart';
import 'package:moonair/modules/buy_ticket/buy_ticket_controller.dart';
import '../../../core/app_themes.dart';
import '../../../global_widgets/button.dart';

class SearchTicket extends StatelessWidget {
  final BuyTicketController _controller = Get.put(BuyTicketController());

  SearchTicket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 45, left: 20, right: 20),
            color: AppColors.primary,
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
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
                      'Chọn chuyến bay',
                      style: CustomTextStyle.h3(AppColors.whitetext),
                    ),
                    IconButton(
                      onPressed: _controller.navigateToChatbotScreen,
                      icon: SizedBox(
                        width: 32,
                        height: 32,
                        child: Image.asset(
                          'lib/assets/icons/message.png',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Image.asset('lib/assets/icons/slide_flight.png'),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
                child: Obx(
              () => Column(
                children: _controller.flights.map((flight) {
                  return TicketWidget(flight: flight);
                }).toList(),
              ),
            )),
          ),
          Obx(() {
            return _controller.isReturnFlight.value
                ? Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: AppButton(
                      buttonText: 'Chọn chuyến chiều về',
                      onPressedFunction: () {},
                    ),
                  )
                : SizedBox();
          }),
        ],
      ),
    );
  }
}
