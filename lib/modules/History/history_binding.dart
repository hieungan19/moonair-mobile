import 'package:get/get.dart';
import 'package:moonair/modules/edit-profile/edit_profile_controller.dart';
import 'package:moonair/modules/history/history_controller.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryController>(() => HistoryController());
  }
}
