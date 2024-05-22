import 'dart:ffi' hide Size;
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/core/app_themes.dart';
import 'package:moonair/global_widgets/button.dart';

class Ticket extends StatefulWidget {
  late int detail;
  final double margin;
  final double borderRadius;
  final double clipRadius;
  final double smallClipRadius;
  final int numberOfSmallClips;
  String s;

  Ticket({
    Key? key,
    required this.detail,
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

class MyTicket extends State<Ticket> {
  bool state_btn = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 4),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height:
              (widget.detail < 0) ? 203 : ((widget.detail == 1) ? 494 : 236),
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
            if (widget.detail != -1)
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
                                Text('Đà Lạt',
                                    style: CustomTextStyle.p3(
                                        AppColors.blacktext)),
                                Text('09:00 AM',
                                    style: CustomTextStyle.p1(
                                        AppColors.blacktext)),
                                Text('Liên Khương',
                                    style:
                                        CustomTextStyle.p2(AppColors.primary)),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('2h 50m',
                                    style: CustomTextStyle.p3bold(
                                        AppColors.blacktext)),
                                Image.asset(
                                  'lib/assets/images/flight_line.png',
                                  height: 25,
                                  width:
                                      (MediaQuery.of(context).size.width / 3),
                                ),
                                Text(
                                    widget.detail != -1
                                        ? '1 điểm dừng'
                                        : 'Bay thẳng',
                                    style: CustomTextStyle.p3(
                                        AppColors.blacktext)),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text('HCM',
                                    style: CustomTextStyle.p3(
                                        AppColors.blacktext)),
                                Text('11:00 AM',
                                    style: CustomTextStyle.p1(
                                        AppColors.blacktext)),
                                Text('Tân Sơn Nhất',
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
                                  Text('Ghế phổ thông',
                                      style: CustomTextStyle.p2bold(
                                          AppColors.blacktext)),
                                  Text('Không được hủy',
                                      style:
                                          CustomTextStyle.p3(AppColors.grey2)),
                                  Text('2.560.000 VNĐ',
                                      style: CustomTextStyle.p1bold(
                                          Color(0xFFFAAD14)))
                                ]),
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.all(10),
                                  fixedSize: Size(100, 10),
                                  backgroundColor: (state_btn)
                                      ? AppColors.primary
                                      : Colors.transparent,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  side: const BorderSide(
                                      color: AppColors.primary),
                                ),
                                onPressed: StateButton,
                                child: Text(state_btn ? 'Đang chọn' : 'Chọn',
                                    style: CustomTextStyle.p3((state_btn)
                                        ? AppColors.whitetext
                                        : AppColors.primary)),
                              ),
                            )
                          ]),
                      if (widget.detail != -1)
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
                                (widget.detail == 1)
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
                      if (widget.detail == 1)
                        Doichuyen('12:30', '14:30','20/04/2024','20/04/2024', 'TP. Hồ Chí Minh', 'Taipei', 'Tân Sơn Nhất', 'Taipei',),
                      if (widget.detail == 1)
                        Text('ĐỔI CHUYẾN',
                            style: CustomTextStyle.p1bold(AppColors.primary)),
                      if (widget.detail == 1)
                        Doichuyen('17:30', '20:20','20/04/2024','20/04/2024', 'Taipei', 'New York', 'Taipei', 'New York'),
                    ]),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 17, top: 12),
                child: Text('#MaMB',
                    style: CustomTextStyle.p2bold(AppColors.blacktext))),
            Container(
              margin: EdgeInsets.fromLTRB(270, 12, 12, 10),
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text('20/04/2024',
                  style: CustomTextStyle.p2bold(AppColors.blacktext)),
            ),
          ]),
        ),
      ),
    );
  }

  void StateButton() {
    setState(() {
      state_btn = !state_btn;
    });
  }

  void doitrangthai() {
    setState(() {
      (widget.detail == 1) ? widget.detail = 0 : widget.detail = 1;
    });
  }

  Widget Doichuyen(String g1, String g2, String t1, String t2, String d1, String d2, String sb1, String sb2) {
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
