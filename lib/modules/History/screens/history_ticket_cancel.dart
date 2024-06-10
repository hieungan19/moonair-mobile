import 'package:flutter/material.dart';
import 'package:moonair/modules/history/history_controller.dart';
import 'package:moonair/modules/history/widgets/ticket_in_history.dart';
import 'package:get/get.dart';

class HistoryCanceledTicket extends StatelessWidget {
  const HistoryCanceledTicket({super.key});

  @override
  Widget build(BuildContext context) {
    final HistoryController controller = Get.find();
    return Obx(() {
      return ListView.builder(
        itemCount: controller.canceledTickets.length,
        itemBuilder: (context, index) {
          return TicketInHistory(ticket: controller.canceledTickets[index]);
        },
      );
    });
  }
}
