import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/widgets.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/global_widgets/GradientContainer.dart';
import 'package:moonair/global_widgets/bottom_navbar.dart';
import 'package:moonair/global_widgets/ticket.dart';
import 'package:moonair/modules/History/widgets/ticket_in_history.dart';
import 'package:moonair/modules/History/widgets/top_navbar.dart';
import 'package:moonair/values/app_assets/app_icons.dart';
import '../../../global_widgets/button.dart';
import '../../../core/app_themes.dart';
import '../../../global_widgets/text_field.dart';

class History extends StatefulWidget {
  final bool khuhoi;

  const History({Key? key, required this.khuhoi});

  @override
  State<StatefulWidget> createState() {
    return HistoryTicket();
  }
}

class HistoryTicket extends State<History> {
  HistoryTicket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 45, left: 20, right: 20),
            color: AppColors.white,
            width: MediaQuery.of(context).size.width,
            height: 144.0,
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.0),
                                    side: const BorderSide(
                                        width: 2, color: AppColors.primary)))),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 25,
                      color: AppColors.primary,
                    ),
                    //  Image.asset(
                    //    'lib/assets/icons/back.png',
                    //    color: AppColors.primary,
                    //  ),
                  ),
                  Text(
                    'Lịch sử vé',
                    style: CustomTextStyle.h3(AppColors.primary),
                  ),
                  IconButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14.0),
                                      side: const BorderSide(
                                          width: 2,
                                          color: AppColors.primary)))),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        size: 25,
                        color: AppColors.primary,
                      )
                      // Image.asset(
                      //   'lib/assets/icons/message.png', scale: 2,
                      // ),
                      ),
                ],
              ),
              const TopNavBar(),
            ]),
          ),
          Flexible(
            child: SingleChildScrollView(
                child: Column(children: [
                  TicketInHistory(detail: 0),
                  TicketInHistory(detail: -1),
                  TicketInHistory(detail: 0),
                  TicketInHistory(detail: -1),
                  TicketInHistory(detail: 0),
                  TicketInHistory(detail: -1)
                ]),
              ),
          ),
        ],
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}
