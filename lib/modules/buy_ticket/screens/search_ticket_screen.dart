import 'package:flutter/material.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/global_widgets/ticket.dart';

import '../../../core/app_themes.dart';
import '../../../global_widgets/button.dart';

class SearchTicket extends StatefulWidget {
  TextEditingController searchController = TextEditingController();
  final bool khuhoi;

  SearchTicket({Key? key, required this.khuhoi});

  @override
  State<StatefulWidget> createState() {
    return MySearchTicket();
  }
}

class MySearchTicket extends State<SearchTicket> {
  MySearchTicket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 45, left: 20, right: 20),
          color: AppColors.primary,
          width: MediaQuery.of(context).size.width,
          height: 150.0,
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'lib/assets/icons/back.png',
                    color: AppColors.white,
                  ),
                ),
                Text(
                  'Chọn chuyến bay',
                  style: CustomTextStyle.h3(AppColors.whitetext),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SizedBox(
                    width: 32,
                    height: 32,
                    child: Image.asset(
                      'lib/assets/icons/message.png',
                    ),
                  ),
                ),
              ],
            ),
            Image.asset('lib/assets/icons/slide_seat.png'),
            const SizedBox(height: 10),
          ]),
        ),
        Flexible(
          child: Container(
            child: SingleChildScrollView(
              child: Column(children: [
                Ticket(detail: 0),
                Ticket(detail: -1),
                Ticket(detail: 0),
                Ticket(detail: -1),
                Ticket(detail: 1),
                Ticket(detail: 0)
              ]),
            ),
          ),
        ),
        if (widget.khuhoi == true)
          Positioned(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  child: AppButton(
                      buttonText: 'Chọn chuyến chiều về',
                      onPressedFunction: () {})))
      ],
    ));
  }
}
