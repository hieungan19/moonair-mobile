import 'package:get/get.dart';
import 'package:moonair/modules/base/base_controller.dart';
import 'package:moonair/modules/history/history_controller.dart';
import 'package:moonair/modules/home/home_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseController>(() => BaseController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<HistoryController>(() => HistoryController());
  }
}
