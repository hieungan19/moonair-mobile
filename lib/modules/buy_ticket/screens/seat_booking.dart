import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moonair/data/models/flight.dart';
import 'package:moonair/modules/buy_ticket/buy_ticket_controller.dart';

import '../../../core/app_colors.dart';
import '../../../core/app_themes.dart';
import '../widgets/seat_class_widget.dart';
import '../widgets/seat_row.dart';
import '../widgets/seat_widget.dart';

class SeatBooking extends StatefulWidget {
  const SeatBooking({Key? key}) : super(key: key);

  @override
  State<SeatBooking> createState() => _SeatBookingScreenState();
}

class _SeatBookingScreenState extends State<SeatBooking> {
  final selectedSeat = ValueNotifier<List<String>>([]);
  final BuyTicketController _controller = Get.find();
  late Flight flight;

  void initializeFlight() async {
    flight = Get.arguments as Flight;

    List<Ticket>? tickets = await _controller.fetchOneTicketById(flight.id);
    flight.updateTickets(tickets);
  }

  @override
  void initState() {
    super.initState();
    initializeFlight();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            width: MediaQuery.of(context).size.width,
            height: 240.0,
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
                      ' Chuyến bay ${flight.flightCode}',
                      style: CustomTextStyle.h4(AppColors.whitetext),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'lib/assets/icons/scroll.png',
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Image.asset('lib/assets/icons/slide_seat.png'),
                const SizedBox(height: 30),
                const SeatInfoWidget(),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 10),
              decoration: const BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: SeatClass(ticketClass: flight.tickets),
                  ),
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(
                              top: 10, left: 20, right: 20, bottom: 90),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              )
                            ],
                          ),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 20, bottom: 20, right: 10),
                              child: ValueListenableBuilder<List<String>>(
                                valueListenable: selectedSeat,
                                builder: (context, value, _) {
                                  return SizedBox(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        for (int i = 1; i <= 10; i++) ...[
                                          SeatRow(
                                            rowNumber: i,
                                            selectedSeats: value,
                                            onSeatTap: (newSelectedSeats) {
                                              selectedSeat.value =
                                                  newSelectedSeats;
                                            },
                                          ),
                                          const SizedBox(height: 10)
                                        ],
                                      ],
                                    ),
                                  );
                                },
                              ),
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
                                      padding: const EdgeInsets.only(
                                          left: 30, top: 5),
                                      child: Text(
                                        'A7, B6',
                                        style: CustomTextStyle.p1(
                                            AppColors.blacktext),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 30),
                                      child: Text(
                                        '4.200.000Đ',
                                        style: CustomTextStyle.h3(
                                            AppColors.blacktext),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      side: const BorderSide(
                                          color: AppColors.primary), // Viền
                                    ),
                                    onPressed: () {
                                      // Xử lý sự kiện khi nút được nhấn
                                    },
                                    child: Text('Tiếp theo',
                                        style: CustomTextStyle.p1(
                                            AppColors.primary)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
