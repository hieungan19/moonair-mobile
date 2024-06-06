import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';
import '../../../core/app_themes.dart';
import 'dash_line.dart';

class BookedDetail extends StatefulWidget {
  int detail;
  final String s;

  BookedDetail({
    super.key,
    required this.detail,
    this.s = '',
  });

  @override
  State<BookedDetail> createState() => _BookedDetailState();
}

class _BookedDetailState extends State<BookedDetail> {
  bool stateBtn = false;

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Đà Lạt',
                            style: CustomTextStyle.p3(AppColors.blacktext)),
                        Text('09:00 AM',
                            style: CustomTextStyle.p1(AppColors.blacktext)),
                        Text('Liên Khương',
                            style: CustomTextStyle.p2(AppColors.primary)),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('2h 50m',
                            style: CustomTextStyle.p3bold(AppColors.blacktext)),
                        Image.asset(
                          'lib/assets/images/flight_line.png',
                          height: 25,
                          width: MediaQuery.of(context).size.width / 3 - 20,
                        ),
                        Text(
                          widget.detail != -1 ? '1 điểm dừng' : 'Bay thẳng',
                          style: CustomTextStyle.p3(AppColors.blacktext),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('HCM',
                            style: CustomTextStyle.p3(AppColors.blacktext)),
                        Text('11:00 AM',
                            style: CustomTextStyle.p1(AppColors.blacktext)),
                        Text('Tân Sơn Nhất',
                            style: CustomTextStyle.p2(AppColors.primary)),
                      ],
                    ),
                  ],
                ),
                if (widget.detail == 1) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomPaint(
                      painter: DashedLinePainter(),
                      child: const SizedBox(width: double.infinity),
                    ),
                  ),
                  doichuyen(
                    '12:30',
                    '14:30',
                    '10/04/2024',
                    '20/04/2024',
                    'TP. Hồ Chí Minh',
                    'Taipei',
                    'Tân Sơn Nhất',
                    'Taipei',
                  ),
                  Text('ĐỔI CHUYẾN',
                      style: CustomTextStyle.p1bold(AppColors.primary)),
                  doichuyen('17:30', '20:20', '20/04/2024', '20/04/2024',
                      'Taipei', 'New York', 'Taipei', 'New York'),
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
                        Text('Nguyễn Thanh Thư',
                            style: CustomTextStyle.p2bold(AppColors.primary)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Số điện thoại',
                            style: CustomTextStyle.p3(AppColors.blacktext)),
                        Text('0819278173',
                            style: CustomTextStyle.p2bold(AppColors.primary)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Ngày sinh',
                            style: CustomTextStyle.p3(AppColors.blacktext)),
                        Text('22/02/2022',
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
                            Text('SBB2',
                                style: CustomTextStyle.p2bold(
                                    AppColors.blacktext)),
                            const SizedBox(height: 10),
                            Text('Ngày đi',
                                style: CustomTextStyle.p3(AppColors.grey2)),
                            const SizedBox(height: 5),
                            Text('12/02/2024',
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
                            Text('Mave',
                                style: CustomTextStyle.p2bold(
                                    AppColors.blacktext)),
                            const SizedBox(height: 10),
                            Text('Giờ bay',
                                style: CustomTextStyle.p3(AppColors.grey2)),
                            const SizedBox(height: 5),
                            Text('12:30 pm',
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
                            Text('B2',
                                style: CustomTextStyle.p2bold(
                                    AppColors.blacktext)),
                            const SizedBox(height: 10),
                            Text('Hạng ghế',
                                style: CustomTextStyle.p3(AppColors.grey2)),
                            const SizedBox(height: 5),
                            Text('Thương gia',
                                style: CustomTextStyle.p2bold(
                                    AppColors.blacktext)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void doitrangthai() {
    setState(() {
      widget.detail = widget.detail == 1 ? 0 : 1;
    });
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
