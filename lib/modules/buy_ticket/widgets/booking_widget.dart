import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';
import '../../../core/app_themes.dart';
import 'dash_line.dart';

class BookingDetail extends StatelessWidget {
  const BookingDetail({super.key});

  @override
  Widget build(BuildContext context) {
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
                      Text('Đà Lạt',
                          style: CustomTextStyle.p3(AppColors.blacktext)),
                      Text('09:00 AM',
                          style: CustomTextStyle.p1(AppColors.blacktext)),
                      Text('Liên Khương',
                          style: CustomTextStyle.p2(AppColors.primary)),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('2h 50m',
                          style: CustomTextStyle.p3bold(AppColors.blacktext)),
                      Image.asset(
                        'lib/assets/images/flight_line.png',
                        height: 25,
                        width: MediaQuery.of(context).size.width / 3 - 10,
                      ),
                      Text('Bay thẳng',
                          style: CustomTextStyle.p3(AppColors.blacktext)),
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
                        'Nguyễn Thanh Thư',
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
                        '0819278173',
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
                        '22/02/2022',
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
                            'SBB2',
                            style: CustomTextStyle.p2bold(AppColors.blacktext),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Ngày đi',
                            style: CustomTextStyle.p3(AppColors.grey2),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '12/02/2024',
                            style: CustomTextStyle.p2bold(AppColors.blacktext),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mã vé',
                            style: CustomTextStyle.p3(AppColors.grey2),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Mave',
                            style: CustomTextStyle.p2bold(AppColors.blacktext),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Giờ bay',
                            style: CustomTextStyle.p3(AppColors.grey2),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '12:30 pm',
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
                            'B2',
                            style: CustomTextStyle.p2bold(AppColors.blacktext),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Hạng ghế',
                            style: CustomTextStyle.p3(AppColors.grey2),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Thương gia',
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
                      child: Text('2000000 vnd',
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
