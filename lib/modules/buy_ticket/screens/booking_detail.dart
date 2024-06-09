import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:moonair/modules/buy_ticket/buy_ticket_controller.dart';
import 'package:moonair/modules/buy_ticket/widgets/popup-bought-ticket.dart';

import '../../../core/app_colors.dart';
import '../../../core/app_themes.dart';
import '../../payment/controllers/payment_controllers.dart';
import '../widgets/booking_widget.dart';

// Chi tiết đặt vé để thanh toán
class MyBookingDetail extends StatefulWidget {
  const MyBookingDetail({super.key});

  @override
  State<MyBookingDetail> createState() => _MyBookingDetailState();
}

class _MyBookingDetailState extends State<MyBookingDetail> {
  Future<void> initPaymentSheet(int amount) async {
    try {
      // 1. create payment intent on the client side by calling stripe api
      final data = await createPaymentIntent(
        // convert string to double
        amount: amount.toString(),
      );

      // 2. initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          // Set to true for custom flow
          customFlow: false,
          // Main params
          merchantDisplayName: 'Test Merchant',
          paymentIntentClientSecret: data['client_secret'],
          // Customer keys
          customerEphemeralKeySecret: data['ephemeralKey'],
          customerId: data['id'],

          style: ThemeMode.dark,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
      rethrow;
    }
  }

  BuyTicketController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  _controller.currentTicketClass.value?.chooseSeats!.length ??
                      0,
                  (index) => BookingDetail(
                    seat: _controller
                            .currentTicketClass.value?.chooseSeats![index] ??
                        0,
                  ),
                ),
              ),
            ),
          ),
          Container(
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
                        '${NumberFormat.currency(locale: 'vi').format(_controller.currentTotal.value)}',
                        style: CustomTextStyle.h4(AppColors.blacktext),
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
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      backgroundColor: AppColors.primary,
                    ),
                    onPressed: () async {
                      await initPaymentSheet(
                          _controller.currentTotal.value.round());

                      try {
                        await Stripe.instance.presentPaymentSheet();
                        await _controller.createInvoice();
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Popup_Bought_Ticket();
                          },
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                            "Thanh toán không thành công.Vui lòng thử lại.",
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.redAccent,
                        ));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child: Text('Thanh toán',
                          style: CustomTextStyle.h4(AppColors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
