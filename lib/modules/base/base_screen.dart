import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moonair/modules/base/base_controller.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/core/app_themes.dart';
import 'package:moonair/global_widgets/bottom_navbar.dart';
import 'package:moonair/modules/edit-profile/screens/profile.dart';
import 'package:moonair/modules/history/screens/history_ticket_screen.dart';
import 'package:moonair/modules/home/screen/home_screen.dart';

class BaseScreen extends StatelessWidget {
  final BaseController _controller = Get.put(BaseController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          switch (_controller.currentIndex.value) {
            case 0:
              return Home();
            case 1:
              return History();
            case 2:
              return UserProfileScreen();
            default:
              return Container(); // Return a default widget or handle other cases
          }
        }),
        bottomNavigationBar: NavBar(),
      ),
    );
  }
}
