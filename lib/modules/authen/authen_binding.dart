import 'package:get/get.dart';
import 'package:moonair/modules/authen/authen_controller.dart';

class AuthenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenController>(() => AuthenController());
  }
}
