import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/modules/history/history_controller.dart';

class TopNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Khởi tạo controller
    final HistoryController historyController = Get.put(HistoryController());

    return Obx(() => TabBar(
          labelColor: AppColors.primary,
          dividerColor: Colors.transparent,
          unselectedLabelColor: AppColors.grey2,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: EdgeInsets.symmetric(horizontal: 25),
          indicatorWeight: 5,
          indicator: UnderlineTabIndicator(
              borderSide: const BorderSide(width: 5, color: AppColors.primary),
              borderRadius: BorderRadius.circular(20)),
          indicatorColor: AppColors.primary,
          tabs: [
            Tab(
              height: 40,
              child: Text('Tất cả',
                  style: GoogleFonts.nunito(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5)),
            ),
            Tab(
              height: 40,
              child: Text('Đã hủy',
                  style: GoogleFonts.nunito(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5)),
            ),
          ],
          controller: historyController.tabController,
        ));
  }
}
