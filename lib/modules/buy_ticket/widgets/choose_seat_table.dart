import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/data/models/flight.dart';
import 'package:moonair/modules/buy_ticket/buy_ticket_controller.dart';
import 'package:moonair/modules/buy_ticket/widgets/seat_widget.dart';

class ChooseSeatTable extends StatelessWidget {
  final BuyTicketController _controller = Get.find();
  final List<Ticket>? tickets;
  ChooseSeatTable({super.key, required this.tickets});

  @override
  Widget build(BuildContext context) {
    final List<int> seatNumbers = List.generate(
        _controller.currentTicketClass.value!.numOfTickets,
        (index) => (index + 1));
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 90),
      padding: const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Obx(() => GridView.builder(
            itemCount: _controller.currentTicketClass.value?.numOfTickets,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, // 4 cột
              mainAxisSpacing: 15, // Khoảng cách giữa các hàng
              crossAxisSpacing: 15.0, // Khoảng cách giữa các cột
            ),
            itemBuilder: (context, index) {
              final seatNumber = seatNumbers[index];
              final isBooked = _controller.currentTicketClass.value?.seatsBooked
                      .contains(seatNumber) ??
                  false;
              print('$index, ${isBooked.toString()}');

              return SeatWidget(
                seatNumber: seatNumber,
                isAvailable: !isBooked,
                isSelected: isBooked, // Hiển thị chỗ ngồi đã được đặt
                onTap: () {},
              );
            },
          )),
    );
  }
}
