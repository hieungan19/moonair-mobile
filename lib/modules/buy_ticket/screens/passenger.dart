import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moonair/assets/icons/app_icons_icons.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/core/app_themes.dart';
import 'package:moonair/global_widgets/button.dart';
import 'package:moonair/modules/buy_ticket/buy_ticket_controller.dart';
import 'package:moonair/modules/buy_ticket/widgets/PassengerForm.dart';
import 'package:moonair/routes/app_route.dart';

class Passenger extends StatelessWidget {
  final BuyTicketController _buyTicketController = Get.find();
  final PageController _pageController = PageController();

  List<int> convertStringToIntArray(String commaSeparatedString) {
    return commaSeparatedString
        .split(',')
        .map((str) => int.parse(str.trim()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    List<int> seats =
        convertStringToIntArray(_buyTicketController.currentChooseSeats.value);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          'Hành khách',
          style: CustomTextStyle.h3(AppColors.blacktext),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            iconSize: 35,
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            icon: Icon(AppIcons.refresh_1),
            onPressed: () {},
          )
        ],
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: IconButton(
            iconSize: 40,
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            icon: Icon(AppIcons.left_square_2),
            onPressed: () {},
          ),
        ),
      ),
      body: SingleChildScrollView(
        // Wrap with SingleChildScrollView
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height -
                  AppBar().preferredSize.height -
                  MediaQuery.of(context)
                      .padding
                      .top, // Ensure PageView takes the available space
              child: PageView.builder(
                controller: _pageController,
                itemCount: seats.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Image.asset('lib/assets/icons/slide_passanger.png'),
                        SizedBox(height: 20),
                        PassengerFormWidget(seat: seats[index]),
                        SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColors.grey2, width: 0.2),
                          ),
                          child: AppButton(
                            buttonText: index == seats.length - 1
                                ? 'Tiếp theo'
                                : 'Tiếp',
                            onPressedFunction: () {
                              if (index == seats.length - 1) {
                                _buyTicketController
                                    .updatePassengerInfo(seats[index]);
                                _buyTicketController.printChooseSeatsInfo(
                                    _buyTicketController
                                        .currentTicketClass.value!);
                                Get.toNamed(AppRoutes.invoice);
                              } else {
                                _buyTicketController
                                    .updatePassengerInfo(seats[index]);

                                _pageController.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeIn,
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
