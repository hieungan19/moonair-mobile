import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/global_widgets/GradientContainer.dart';
import 'package:moonair/global_widgets/ticket.dart';
import '../../../global_widgets/button.dart';
import '../../../core/app_themes.dart';
import '../../../global_widgets/text_field.dart';

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
          height: 145.0,
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0),
                              side: BorderSide(
                                  width: 2, color: AppColors.primary)))),
                  onPressed: () {},
                  icon: Icon(
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
                  'Chọn chuyến bay',
                  style: CustomTextStyle.h3(AppColors.whitetext),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'lib/assets/icons/message.png',
                    scale: 2,
                  ),
                ),
              ],
            ),
            Image.asset('lib/assets/icons/slide_seat.png'),
            const SizedBox(height: 10),
          ]),
        ),
        TabBarView(children: [
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
          Flexible(
            child: Container(
              child: SingleChildScrollView(
                child:
                    Column(children: [Ticket(detail: 0), Ticket(detail: -1)]),
              ),
            ),
          ),
        ]),
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
