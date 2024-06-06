import 'package:get/get.dart';
import 'package:moonair/modules/buy_ticket/buy_ticket_controller.dart';

class BuyTicketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BuyTicketController>(() => BuyTicketController());
  }
}
