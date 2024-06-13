import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/core/app_themes.dart';
import 'package:moonair/data/models/flight.dart';
import 'package:intl/intl.dart';
import 'package:moonair/data/services/data_center.dart';
import 'package:moonair/modules/buy_ticket/buy_ticket_controller.dart';
import 'package:moonair/routes/app_route.dart';
import 'package:moonair/data/models/flight.dart';

String formatDuration(int minutes) {
  if (minutes < 60) {
    return '$minutes m';
  } else {
    int hours = minutes ~/ 60;
    int remainingMinutes = minutes % 60;
    return '${hours}h  ${remainingMinutes}m';
  }
}

class TicketWidget extends StatefulWidget {
  final Flight flight;
  final double margin;
  final double borderRadius;
  final double clipRadius;
  final double smallClipRadius;
  final int numberOfSmallClips;

  String s;

  TicketWidget({
    Key? key,
    required this.flight,
    this.margin = 20,
    this.borderRadius = 20,
    this.clipRadius = 5,
    this.smallClipRadius = 3,
    this.numberOfSmallClips = 13,
    this.s = '',
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyTicket();
  }
}

class MyTicket extends State<TicketWidget> {
  bool canSelectSeat() {
    _buyTicketController.currentFlight.value = widget.flight;

    DateTime takeOffTime =
        _buyTicketController.currentFlight.value!.takeoffTime;
    DateTime now = DateTime.now();

    Duration difference = takeOffTime.difference(now);
    int differenceInMinutes = difference.inMinutes;

    return differenceInMinutes > DataCenter.rule!.latestTimeForBooking;
  }

  bool state_btn = false;
  late int detail;
  late int transitCount;
  @override
  void initState() {
    super.initState();
    transitCount = widget.flight.transitAirportCount;
    detail = widget.flight.transitAirportCount > 0
        ? 0
        : -1; // Gán giá trị cho detail trong initState
  }

  BuyTicketController _buyTicketController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 4),
        child: Container(
          width: MediaQuery.of(context).size.width,
          // height:
          //     (widget.detail < 0) ? 203 : ((widget.detail == 1) ? 494 : 236),
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 8),
                color: AppColors.dropShadow,
                blurRadius: 37,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Stack(children: [
            Padding(
              padding: EdgeInsets.fromLTRB(7, 48, 0, 0),
              child: CustomPaint(
                  painter: DashedLinePainter(),
                  child: Container(
                    height: 10,
                    width: 368,
                  )),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(7, 124, 0, 0),
              child: CustomPaint(
                  painter: DashedLinePainter(),
                  child: Container(
                    height: 10,
                    width: 368,
                  )),
            ),
            if (detail != -1)
              Padding(
                padding: EdgeInsets.fromLTRB(3, 205, 0, 0),
                child: CustomPaint(
                    painter: DashedLinePainter(),
                    child: Container(
                      height: 10,
                      width: 378,
                    )),
              ),
            ClipPath(
              clipper: TicketClipper(
                borderRadius: widget.borderRadius,
                clipRadius: widget.clipRadius,
                smallClipRadius: widget.smallClipRadius,
                numberOfSmallClips: widget.numberOfSmallClips,
              ),
              child: Container(
                color: AppColors.tint2,
                padding: const EdgeInsets.fromLTRB(10, 52, 10, 0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(widget.flight.departureAirport.city,
                                    style: CustomTextStyle.p3(
                                        AppColors.blacktext)),
                                Text(
                                    DateFormat('hh:mm a')
                                        .format(widget.flight.takeoffTime),
                                    style: CustomTextStyle.p1(
                                        AppColors.blacktext)),
                                Text(widget.flight.departureAirport.name,
                                    style:
                                        CustomTextStyle.p2(AppColors.primary)),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(formatDuration(widget.flight.duration),
                                    style: CustomTextStyle.p3bold(
                                        AppColors.blacktext)),
                                Image.asset(
                                  'lib/assets/images/flight_line.png',
                                  height: 25,
                                  width:
                                      (MediaQuery.of(context).size.width / 3),
                                ),
                                Text(
                                    detail != -1
                                        ? '${widget.flight.transitAirportCount} điểm dừng'
                                        : 'Bay thẳng',
                                    style: CustomTextStyle.p3(
                                        AppColors.blacktext)),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(widget.flight.destinationAirport.city,
                                    style: CustomTextStyle.p3(
                                        AppColors.blacktext)),
                                Text(
                                    DateFormat('hh:mm a')
                                        .format(widget.flight.landingTime),
                                    style: CustomTextStyle.p1(
                                        AppColors.blacktext)),
                                Text(widget.flight.destinationAirport.name,
                                    style:
                                        CustomTextStyle.p2(AppColors.primary)),
                              ],
                            ),
                          ]),
                      SizedBox(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(widget.flight.nameMinPrice,
                                      style: CustomTextStyle.p2bold(
                                          AppColors.blacktext)),
                                  Text('Được hủy',
                                      style:
                                          CustomTextStyle.p3(AppColors.grey2)),
                                  Text(
                                      '${NumberFormat.currency(locale: 'vi').format(widget.flight.minPrice)}',
                                      style: CustomTextStyle.p1bold(
                                          Color(0xFFFAAD14)))
                                ]),
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.all(10),
                                  fixedSize: Size(100, 10),
                                  backgroundColor: Colors.transparent,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  side: const BorderSide(
                                      color: AppColors.primary),
                                ),
                                onPressed: () async {
                                  if (canSelectSeat()) {
                                    List<Ticket>? tickets =
                                        await _buyTicketController
                                            .fetchOneTicketById(
                                                widget.flight.id);
                                    _buyTicketController.currentFlight.value!
                                        .updateTickets(tickets);
                                    Future.delayed(const Duration(seconds: 1),
                                        () {
                                      Get.toNamed(AppRoutes.seatBook);
                                    });
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text(
                                        "Không thể đặt vé cho chuyến bay này.",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      backgroundColor: Colors.redAccent,
                                    ));
                                  }
                                },
                                child: Text('Chọn chỗ',
                                    style:
                                        CustomTextStyle.p3(AppColors.primary)),
                              ),
                            )
                          ]),
                      if (detail != -1)
                        Container(
                            padding: EdgeInsets.only(top: 6),
                            height: 33,
                            alignment: Alignment.bottomLeft,
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Text('Chi tiết chuyến bay',
                                    style: CustomTextStyle.p3bold(
                                        AppColors.grey2)),
                                (detail == 1)
                                    ? const Padding(
                                        padding: EdgeInsets.only(left: 140),
                                        child: Icon(
                                          Icons.arrow_circle_up_outlined,
                                          color: AppColors.grey2,
                                        ),
                                      )
                                    : const Padding(
                                        padding: EdgeInsets.only(left: 140),
                                        child: Icon(
                                          Icons.arrow_circle_down_outlined,
                                          color: AppColors.grey2,
                                        ),
                                      ),
                                ElevatedButton(
                                  onPressed: doitrangthai,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    surfaceTintColor: Colors.transparent,
                                    side: BorderSide.none,
                                  ),
                                  child: SizedBox(height: 8, width: 315),
                                )
                              ],
                            )),
                      if (detail == 1)
                        Doichuyen(
                          DateFormat('hh:mm a')
                              .format(widget.flight.takeoffTime),
                          DateFormat('hh:mm a').format(widget
                              .flight.transitAirports[0].transitStartTime),
                          DateFormat('yyyy-MM-dd')
                              .format(widget.flight.takeoffTime),
                          DateFormat('yyyy-MM-dd').format(widget
                              .flight.transitAirports[0].transitStartTime),
                          widget.flight.departureAirport.city,
                          widget.flight.transitAirports[0].airport.city,
                          widget.flight.departureAirport.name,
                          widget.flight.transitAirports[0].airport.name,
                        ),
                      if (widget.flight.transitAirportCount > 1)
                        Column(
                            children: List.generate(
                                widget.flight.transitAirportCount - 1, (i) {
                          if (i == 0)
                            return Container(); // Skip the first element if necessary
                          return Doichuyen(
                            DateFormat('hh:mm a').format(widget.flight
                                .transitAirports[i - 1].transitStartTime),
                            DateFormat('hh:mm a').format(widget
                                .flight.transitAirports[i].transitStartTime),
                            DateFormat('yyyy-MM-dd').format(widget.flight
                                .transitAirports[i - 1].transitStartTime),
                            DateFormat('yyyy-MM-dd').format(widget
                                .flight.transitAirports[i].transitStartTime),
                            widget.flight.transitAirports[i - 1].airport.city,
                            widget.flight.transitAirports[i].airport.city,
                            widget.flight.transitAirports[i - 1].airport.name,
                            widget.flight.transitAirports[i].airport.name,
                          );
                        })),
                      if (detail == 1)
                        Text('Đổi chuyến',
                            style: CustomTextStyle.p1bold(AppColors.primary)),
                      if (detail == 1)
                        Doichuyen(
                          DateFormat('hh:mm a').format(widget
                              .flight
                              .transitAirports[transitCount - 1]
                              .transitEndTime),
                          DateFormat('hh:mm a')
                              .format(widget.flight.landingTime),
                          DateFormat('yyyy-MM-dd').format(widget
                              .flight
                              .transitAirports[transitCount - 1]
                              .transitEndTime),
                          DateFormat('yyyy-MM-dd')
                              .format(widget.flight.landingTime),
                          widget.flight.transitAirports[transitCount - 1]
                              .airport.city,
                          widget.flight.destinationAirport.city,
                          widget.flight.transitAirports[transitCount - 1]
                              .airport.name,
                          widget.flight.destinationAirport.name,
                        ),
                    ]),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 17, top: 12),
                child: Text(widget.flight.flightCode,
                    style: CustomTextStyle.p2bold(AppColors.blacktext))),
            Container(
              margin: EdgeInsets.fromLTRB(250, 12, 12, 10),
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                  DateFormat('yyyy-MM-dd').format(widget.flight.takeoffTime),
                  style: CustomTextStyle.p3bold(AppColors.blacktext)),
            ),
          ]),
        ),
      ),
    );
  }

  void doitrangthai() {
    setState(() {
      (detail == 1) ? detail = 0 : detail = 1;
    });
  }

  Widget Doichuyen(String g1, String g2, String t1, String t2, String d1,
      String d2, String sb1, String sb2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(g1, style: CustomTextStyle.p3bold(AppColors.blacktext)),
          Text(t1, style: CustomTextStyle.p4(AppColors.blacktext)),
          Text(''),
          Text(g2, style: CustomTextStyle.p3bold(AppColors.blacktext)),
          Text(t2, style: CustomTextStyle.p4(AppColors.blacktext)),
        ]),
        Image.asset('lib/assets/images/cnt_trip.png', height: 60, width: 22),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Bay từ: ', style: CustomTextStyle.p3(AppColors.grey2)),
            Text('Sân bay: ', style: CustomTextStyle.p3(AppColors.grey2)),
            Text(''),
            Text('Bay đến: ', style: CustomTextStyle.p3(AppColors.grey2)),
            Text('Sân bay: ', style: CustomTextStyle.p3(AppColors.grey2)),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(d1, style: CustomTextStyle.p3(AppColors.blacktext)),
            Text(sb1, style: CustomTextStyle.p3(AppColors.blacktext)),
            Text(''),
            Text(d2, style: CustomTextStyle.p3(AppColors.blacktext)),
            Text(sb2, style: CustomTextStyle.p3(AppColors.blacktext)),
          ],
        ),
      ]),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  static const double clipPadding = 0;

  final double borderRadius;
  final double clipRadius;
  final double smallClipRadius;
  final int numberOfSmallClips;

  const TicketClipper({
    required this.borderRadius,
    required this.clipRadius,
    required this.smallClipRadius,
    required this.numberOfSmallClips,
  });

  @override
  Path getClip(Size size) {
    var path = Path();

    final clipCenterY = 44 + clipRadius;
    final clipCenterY2 = 120 + clipRadius;

    // draw rect
    path.addRRect(RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(borderRadius),
    ));

    final clipPath = Path();

    // circle on the left
    clipPath.addOval(Rect.fromCircle(
      center: Offset(0, clipCenterY),
      radius: clipRadius,
    ));

    // circle on the right
    clipPath.addOval(Rect.fromCircle(
      center: Offset(size.width, clipCenterY),
      radius: clipRadius,
    ));

    clipPath.addOval(Rect.fromCircle(
      center: Offset(0, clipCenterY2),
      radius: clipRadius,
    ));

    // circle on the right
    clipPath.addOval(Rect.fromCircle(
      center: Offset(size.width, clipCenterY2),
      radius: clipRadius,
    ));

    // combine two path together
    final ticketPath = Path.combine(
      PathOperation.reverseDifference,
      clipPath,
      path,
    );

    return ticketPath;
  }

  @override
  bool shouldReclip(TicketClipper old) =>
      old.borderRadius != borderRadius ||
      old.clipRadius != clipRadius ||
      old.smallClipRadius != smallClipRadius ||
      old.numberOfSmallClips != numberOfSmallClips;
}

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
