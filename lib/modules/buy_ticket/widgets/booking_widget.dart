import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:moonair/data/models/flight.dart';
import 'package:moonair/global_widgets/ticket.dart';
import 'package:moonair/modules/buy_ticket/buy_ticket_controller.dart';

import '../../../core/app_colors.dart';
import '../../../core/app_themes.dart';

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 5;
    double dashSpace = 3;
    double startX = 0;
    final paint = Paint()
      ..color = AppColors.grey2.withOpacity(.5)
      ..strokeWidth = 1;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class BookingDetail extends StatelessWidget {
  int seat;
  BookingDetail({super.key, required this.seat});
  final BuyTicketController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    Flight flight = _controller.currentFlight.value!;
    Ticket tickets = _controller.currentTicketClass.value!;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(flight.departureAirport.city,
                          style: CustomTextStyle.p3(AppColors.blacktext)),
                      Text(DateFormat('hh:mm a').format(flight.takeoffTime),
                          style: CustomTextStyle.p1(AppColors.blacktext)),
                      Text(flight.departureAirport.name,
                          style: CustomTextStyle.p2(AppColors.primary)),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(formatDuration(flight.duration),
                          style: CustomTextStyle.p3bold(AppColors.blacktext)),
                      Image.asset(
                        'lib/assets/images/flight_line.png',
                        height: 25,
                        width: MediaQuery.of(context).size.width / 3 - 10,
                      ),
                      Text(
                          flight.transitAirportCount < 0
                              ? 'Bay thẳng'
                              : '${flight.transitAirportCount} điểm dừng',
                          style: CustomTextStyle.p3(AppColors.blacktext)),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(flight.destinationAirport.city,
                          style: CustomTextStyle.p3(AppColors.blacktext)),
                      Text(DateFormat('hh:mm a').format(flight.landingTime),
                          style: CustomTextStyle.p1(AppColors.blacktext)),
                      Text(flight.destinationAirport.name,
                          style: CustomTextStyle.p2(AppColors.primary)),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomPaint(
                    painter: DashedLinePainter(),
                    child: const SizedBox(
                      width: double.infinity,
                    )),
              ),

              //Thông tin người mua
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tên',
                        style: CustomTextStyle.p3(AppColors.blacktext),
                      ),
                      Text(
                        tickets.chooseSeatsPasInfo![seat]!.passengerName,
                        style: CustomTextStyle.p2bold(AppColors.primary),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Số điện thoại',
                        style: CustomTextStyle.p3(AppColors.blacktext),
                      ),
                      Text(
                        tickets.chooseSeatsPasInfo![seat]!.phoneNumber,
                        style: CustomTextStyle.p2bold(AppColors.primary),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ngày sinh',
                        style: CustomTextStyle.p3(AppColors.blacktext),
                      ),
                      Text(
                        DateFormat('dd/MM/yyyy').format(
                            tickets.chooseSeatsPasInfo![seat]!.dateOfBirth),
                        style: CustomTextStyle.p2bold(AppColors.primary),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomPaint(
                    painter: DashedLinePainter(),
                    child: const SizedBox(
                      width: double.infinity,
                    )),
              ),

              //Thông tin vé
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mã CB',
                            style: CustomTextStyle.p3(AppColors.grey2),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            flight.flightCode,
                            style: CustomTextStyle.p2bold(AppColors.blacktext),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Ngày đi',
                            style: CustomTextStyle.p3(AppColors.grey2),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            DateFormat('dd/MM/yyyy').format(flight.takeoffTime),
                            style: CustomTextStyle.p2bold(AppColors.blacktext),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '',
                            style: CustomTextStyle.p3(AppColors.grey2),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '',
                            style: CustomTextStyle.p2bold(AppColors.blacktext),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Giờ bay',
                            style: CustomTextStyle.p3(AppColors.grey2),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            DateFormat('hh:mm a').format(flight.takeoffTime),
                            style: CustomTextStyle.p2bold(AppColors.blacktext),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ghế ngồi',
                            style: CustomTextStyle.p3(AppColors.grey2),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            seat.toString(),
                            style: CustomTextStyle.p2bold(AppColors.blacktext),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Hạng ghế',
                            style: CustomTextStyle.p3(AppColors.grey2),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            tickets.className,
                            style: CustomTextStyle.p2bold(AppColors.blacktext),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomPaint(
                    painter: DashedLinePainter(),
                    child: const SizedBox(
                      width: double.infinity,
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Giá vé',
                          style: CustomTextStyle.p3(AppColors.grey2),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '01 Vé',
                          style: CustomTextStyle.p2bold(AppColors.blacktext),
                        ),
                      ]),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.secondary,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                          '${NumberFormat.currency(locale: 'vi').format(flight.price * tickets.ratio)}',
                          style: CustomTextStyle.p1bold(AppColors.primary)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
