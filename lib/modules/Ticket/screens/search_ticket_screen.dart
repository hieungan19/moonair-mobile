import 'package:flutter/material.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/global_widgets/ticket.dart';

import '../../../core/app_themes.dart';
import '../../../global_widgets/button.dart';

class SearchTicket extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  final bool khuhoi;

  SearchTicket({Key? key, required this.khuhoi}) : super(key: key);

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
            height: 145.0,
            child: Column(
              children: [
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
                      icon: Image.asset(
                        'lib/assets/icons/message.png',
                      ),
                    ),
                  ],
                ),
                Image.asset('lib/assets/icons/slide_seat.png'),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Ticket(detail: 0),
                  Ticket(detail: -1),
                  Ticket(detail: 0),
                  Ticket(detail: -1),
                  Ticket(detail: 1),
                  Ticket(detail: 0),
                ],
              ),
            ),
          ),
          if (khuhoi)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: AppButton(
                buttonText: 'Chọn chuyến chiều về',
                onPressedFunction: () {},
              ),
            ),
        ],
      ),
    );
  }
}
