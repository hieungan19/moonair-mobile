import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/core/app_themes.dart';

class Ticket extends StatelessWidget {
  final double margin;
  final double borderRadius;
  final double clipRadius;
  final double smallClipRadius;
  final int numberOfSmallClips;

  const Ticket({
    Key? key,
    this.margin = 20,
    this.borderRadius = 20,
    this.clipRadius = 16,
    this.smallClipRadius = 3,
    this.numberOfSmallClips = 13,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 170,
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
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 60, 0, 0),
            child: CustomPaint(
              painter: DashedLinePainter(),
              child: Container(
                height: 10,
                width: 344,
              )),
          ),
          ClipPath(
          clipper: TicketClipper(
            borderRadius: borderRadius,
            clipRadius: clipRadius,
            smallClipRadius: smallClipRadius,
            numberOfSmallClips: numberOfSmallClips,
          ),
          child: Container(
            color: AppColors.tint2,
            child: Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 60, 10, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Đà Lạt', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                        Text('Liên Khương', style: TextStyle(fontSize: 16, color: AppColors.primary, fontWeight: FontWeight.bold)),
                        Text('09:00 AM', style: TextStyle(fontSize: 14, color: AppColors.grey2, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('1 chặng dừng', style: TextStyle(fontSize: 14)),
                        Image.asset('lib/assets/images/flight_line.png',scale: 2,),
                        Text('2 giờ 50 phút', style: TextStyle(fontSize: 14)),
                      ],
                    ),
                    SizedBox(height: 10),
                    const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('HCM', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                        Text('Tân Sơn Nhất', style: TextStyle(fontSize: 16, color: AppColors.primary, fontWeight: FontWeight.bold)),
                        Text('11:00 AM', style: TextStyle(fontSize: 14, color: AppColors.grey2, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ]),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Text('#MaMB', style:TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
        Container(
            margin: EdgeInsets.fromLTRB(230, 17, 20, 10),
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: AppColors.tint1,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Icon(Icons.calendar_month_outlined),Text('20/04/2024', style: TextStyle())]),
          ),
      ]),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  static const double clipPadding = 18;

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

    final clipCenterY = size.height * 0.25 + clipRadius;

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

    // draw small clip circles
  //   final clipContainerSize = size.width - clipRadius * 2 - clipPadding * 2;
  //   final smallClipSize = smallClipRadius * 2;
  //   final smallClipBoxSize = clipContainerSize / numberOfSmallClips;
  //   final smallClipPadding = (smallClipBoxSize - smallClipSize) / 2;
  //   final smallClipStart = clipRadius + clipPadding;

  //   final smallClipCenterOffsets = List.generate(numberOfSmallClips, (index) {
  //     final boxX = smallClipStart + smallClipBoxSize * index;
  //     final centerX = boxX + smallClipPadding + smallClipRadius;

  //     return Offset(centerX, clipCenterY);
  //   });

  //   // smallClipCenterOffsets.forEach((centerOffset) {
  //   //   clipPath.addOval(Rect.fromCircle(
  //   //     center: centerOffset,
  //   //     radius: smallClipRadius,
  //   //   ));
  //   // });

  // smallClipCenterOffsets.forEach((centerOffset) {
  //     clipPath.addOval(Rect.fromCenter(
  //       center: centerOffset,
  //       width: 12,
  //       height: 3
  //     ));
  //   });
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