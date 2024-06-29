import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/modules/base/base_controller.dart';

class NavBar extends StatelessWidget {
  final BaseController _controller = Get.find<BaseController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: AppColors.grey2.withOpacity(0.5),
              )
            ],
          ),
          child: GNav(
            rippleColor: AppColors.grey1,
            hoverColor: AppColors.grey1,
            gap: 8,
            activeColor: AppColors.blacktext,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: AppColors.grey1,
            color: Colors.black,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.confirmation_num_outlined,
                text: 'Ticket',
              ),
              GButton(
                icon: LineIcons.user,
                text: 'Profile',
              ),
            ],
            selectedIndex: _controller.currentIndex.value,
            onTabChange: (index) {
              _controller.changeTabIndex(index);
            },
          ),
        ));
  }
}
