import 'package:get/get.dart';
import 'package:moonair/modules/base/bottomAppBarController.dart';
import 'package:moonair/modules/history/history_controller.dart';
import 'package:moonair/modules/home/home_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomAppBarController>(() => BottomAppBarController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<HistoryController>(() => HistoryController());
  }
}
