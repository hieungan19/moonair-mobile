import 'package:flutter/material.dart';
import 'package:moonair/modules/history/history_controller.dart';
import 'package:moonair/modules/history/widgets/ticket_in_history.dart';
import 'package:get/get.dart';

class HistoryPaidTicket extends StatelessWidget {
  const HistoryPaidTicket({super.key});

  @override
  Widget build(BuildContext context) {
    final HistoryController controller = Get.find();
    return Obx(() {
      return ListView.builder(
        itemCount: controller.paidTickets.length,
        itemBuilder: (context, index) {
          return TicketInHistory(ticket: controller.paidTickets[index]);
        },
      );
    });
  }
}
