import 'package:flutter/material.dart';
import 'package:moonair/data/models/flightInHistory.dart';
import 'package:moonair/global_widgets/ticket.dart';
import '../../../core/app_colors.dart';
import '../../../core/app_themes.dart';
import 'package:intl/intl.dart';

class BookedDetail extends StatefulWidget {
  final BoughtTicket ticket;

  BookedDetail({
    super.key,
    required this.ticket,
  });

  @override
  State<BookedDetail> createState() => _BookedDetailState();
}

class _BookedDetailState extends State<BookedDetail> {
  bool stateBtn = false;
  late int transitCount;
  late BoughtTicket t;
  late FlightHistory flight;
  @override
  void initState() {
    super.initState();
    transitCount = widget.ticket.flight!.transitAirports.length;
    flight = widget.ticket.flight!;
    t = widget.ticket;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(0, 57, 59, 59).withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(formatDuration(flight.duration),
                              style:
                                  CustomTextStyle.p3bold(AppColors.blacktext)),
                          Image.asset(
                            'lib/assets/images/flight_line.png',
                            height: 30,
                            width: (MediaQuery.of(context).size.width / 3),
                          ),
                          Text(
                              widget.ticket.flight!.transitAirports.isNotEmpty
                                  ? ' ${widget.ticket.flight!.transitAirports.length}điểm dừng'
                                  : 'Bay thẳng',
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
                    ]),
                if (transitCount > 0) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomPaint(
                      painter: DashedLinePainter(),
                      child: const SizedBox(width: double.infinity),
                    ),
                  ),
                  doichuyen(
                    DateFormat('hh:mm a').format(flight.takeoffTime),
                    DateFormat('hh:mm a')
                        .format(flight.transitAirports[0].transitStartTime),
                    DateFormat('yyyy-MM-dd').format(flight.takeoffTime),
                    DateFormat('yyyy-MM-dd')
                        .format(flight.transitAirports[0].transitStartTime),
                    flight.departureAirport.city,
                    flight.transitAirports[0].airport.city,
                    flight.departureAirport.name,
                    flight.transitAirports[0].airport.name,
                  ),
                  if (transitCount > 1)
                    Column(
                        children: List.generate(transitCount - 1, (i) {
                      if (i == 0)
                        return Container(); // Skip the first element if necessary
                      return doichuyen(
                        DateFormat('hh:mm a').format(
                            flight.transitAirports[i - 1].transitStartTime),
                        DateFormat('hh:mm a')
                            .format(flight.transitAirports[i].transitStartTime),
                        DateFormat('yyyy-MM-dd').format(
                            flight.transitAirports[i - 1].transitStartTime),
                        DateFormat('yyyy-MM-dd')
                            .format(flight.transitAirports[i].transitStartTime),
                        flight.transitAirports[i - 1].airport.city,
                        flight.transitAirports[i].airport.city,
                        flight.transitAirports[i - 1].airport.name,
                        flight.transitAirports[i].airport.name,
                      );
                    })),
                  if (transitCount > 0)
                    doichuyen(
                      DateFormat('hh:mm a').format(flight
                          .transitAirports[transitCount - 1].transitEndTime),
                      DateFormat('hh:mm a').format(flight.landingTime),
                      DateFormat('yyyy-MM-dd').format(flight
                          .transitAirports[transitCount - 1].transitEndTime),
                      DateFormat('yyyy-MM-dd').format(flight.landingTime),
                      flight.transitAirports[transitCount - 1].airport.city,
                      flight.destinationAirport.city,
                      flight.transitAirports[transitCount - 1].airport.name,
                      flight.destinationAirport.name,
                    ),
                ],
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CustomPaint(
                    painter: DashedLinePainter(),
                    child: const SizedBox(width: double.infinity),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tên',
                            style: CustomTextStyle.p3(AppColors.blacktext)),
                        Text(t.passengerName,
                            style: CustomTextStyle.p2bold(AppColors.primary)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Số điện thoại',
                            style: CustomTextStyle.p3(AppColors.blacktext)),
                        Text(t.phoneNumber,
                            style: CustomTextStyle.p2bold(AppColors.primary)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Ngày sinh',
                            style: CustomTextStyle.p3(AppColors.blacktext)),
                        Text(DateFormat('dd/MM/yyyy').format(t.dateOfBirth),
                            style: CustomTextStyle.p2bold(AppColors.primary)),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CustomPaint(
                    painter: DashedLinePainter(),
                    child: const SizedBox(width: double.infinity),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Mã CB',
                                style: CustomTextStyle.p3(AppColors.grey2)),
                            const SizedBox(height: 5),
                            Text(flight.code,
                                style: CustomTextStyle.p2bold(
                                    AppColors.blacktext)),
                            const SizedBox(height: 10),
                            Text('Ngày đi',
                                style: CustomTextStyle.p3(AppColors.grey2)),
                            const SizedBox(height: 5),
                            Text(
                                DateFormat('dd/MM/yyyy')
                                    .format(flight.takeoffTime),
                                style: CustomTextStyle.p2bold(
                                    AppColors.blacktext)),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Mã vé',
                                style: CustomTextStyle.p3(AppColors.grey2)),
                            const SizedBox(height: 5),
                            Text(t.code,
                                style: CustomTextStyle.p2bold(
                                    AppColors.blacktext)),
                            const SizedBox(height: 10),
                            Text('Giờ bay',
                                style: CustomTextStyle.p3(AppColors.grey2)),
                            const SizedBox(height: 5),
                            Text(
                                DateFormat('hh:mm a')
                                    .format(flight.takeoffTime),
                                style: CustomTextStyle.p2bold(
                                    AppColors.blacktext)),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Ghế ngồi',
                                style: CustomTextStyle.p3(AppColors.grey2)),
                            const SizedBox(height: 5),
                            Text(t.seatNo.toString(),
                                style: CustomTextStyle.p2bold(
                                    AppColors.blacktext)),
                            const SizedBox(height: 10),
                            Text('Hạng ghế',
                                style: CustomTextStyle.p3(AppColors.grey2)),
                            const SizedBox(height: 5),
                            Text(t.ticketClass!.name,
                                style: CustomTextStyle.p2bold(
                                    AppColors.blacktext)),
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
                    Text(
                      'Giá vé',
                      style: CustomTextStyle.h4(AppColors.grey2),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.secondary,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                            '${NumberFormat.currency(locale: 'vi').format(t.price)}',
                            style: CustomTextStyle.p1bold(AppColors.primary)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget doichuyen(String g1, String g2, String t1, String t2, String d1,
      String d2, String sb1, String sb2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(g1, style: CustomTextStyle.p3bold(AppColors.blacktext)),
          Text(t1, style: CustomTextStyle.p4(AppColors.blacktext)),
          const Text(''),
          Text(g2, style: CustomTextStyle.p3bold(AppColors.blacktext)),
          Text(t2, style: CustomTextStyle.p4(AppColors.blacktext)),
        ]),
        Image.asset('lib/assets/images/cnt_trip.png', height: 60, width: 22),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Bay từ: ', style: CustomTextStyle.p3(AppColors.grey2)),
            Text('Sân bay: ', style: CustomTextStyle.p3(AppColors.grey2)),
            const Text(''),
            Text('Bay đến: ', style: CustomTextStyle.p3(AppColors.grey2)),
            Text('Sân bay: ', style: CustomTextStyle.p3(AppColors.grey2)),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(d1, style: CustomTextStyle.p3(AppColors.blacktext)),
            Text(sb1, style: CustomTextStyle.p3(AppColors.blacktext)),
            const Text(''),
            Text(d2, style: CustomTextStyle.p3(AppColors.blacktext)),
            Text(sb2, style: CustomTextStyle.p3(AppColors.blacktext)),
          ],
        ),
      ]),
    );
  }
}
