import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/core/app_themes.dart';

import '../../../global_widgets/button.dart';

class TicketInHistory extends StatefulWidget {
  late int detail;
  final double margin;
  final double borderRadius;
  final double clipRadius;
  final double smallClipRadius;
  final int numberOfSmallClips;
  String s;

  TicketInHistory({
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
    return MyTicketInHistory();
  }
}

class MyTicketInHistory extends State<TicketInHistory> {
  bool state_btn = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 4),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 205,
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
            ClipPath(
              clipper: TicketClipper(
                borderRadius: widget.borderRadius,
                clipRadius: widget.clipRadius,
                smallClipRadius: widget.smallClipRadius,
                numberOfSmallClips: widget.numberOfSmallClips,
              ),
              child: Container(
                color: AppColors.tint2,
                padding: const EdgeInsets.fromLTRB(10, 52, 10, 3),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(height: 10),
                      Row(
                          mainAxisSize: MainAxisSize.max,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('2h 50m',
                                    style: CustomTextStyle.p3bold(
                                        AppColors.blacktext)),
                                Image.asset(
                                  'lib/assets/images/flight_line.png',
                                  height: 30,
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
                      Row(
                        children: [
                          Expanded(
                            child: AppButton(
                              buttonText: 'Hủy',
                              onPressedFunction: () {},
                            ),
                          ),
                          SizedBox(
                              width:
                                  8.0), // Add some spacing between the buttons
                          Expanded(
                            child: AppButton(
                              buttonText: 'Chi tiết',
                              onPressedFunction: () {},
                            ),
                          ),
                        ],
                      )
                    ]),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 17, top: 12),
                child: Text('#MaMB',
                    style: CustomTextStyle.p2bold(AppColors.blacktext))),
            Container(
              margin: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width / 3 * 2 - 35, 12, 10, 10),
              padding: EdgeInsets.all(2),
              alignment: Alignment.topRight,
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

  void doitrangthai() {
    setState(() {
      (widget.detail == 1) ? widget.detail = 0 : widget.detail = 1;
    });
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
    // final clipCenterY2 = 120 + clipRadius;

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
