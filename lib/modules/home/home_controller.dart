import 'package:get/get.dart';
import 'package:moonair/routes/app_route.dart';

class HomeController extends GetxController {
  void navigateToChatbotScreen() {
    print('To chat bot');
    Get.toNamed(AppRoutes.chatbotPage);
  }
}
