import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/modules/history/history_controller.dart';
import 'package:moonair/modules/history/screens/history_ticket_cancel.dart';
import 'package:moonair/modules/history/screens/history_ticket_paid.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/app_themes.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sử dụng Get.find để tìm HistoryController
    final HistoryController historyController = Get.put(HistoryController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Lịch sử vé', style: CustomTextStyle.h3(AppColors.primary)),
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () {
            // Xử lý khi nhấn nút back
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: AppColors.primary),
            onPressed: () {
              // Xử lý khi nhấn nút search
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: TabBar(
            controller: historyController.tabController,
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.grey2,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 25),
            indicatorWeight: 5,
            indicator: UnderlineTabIndicator(
                borderSide:
                    const BorderSide(width: 5, color: AppColors.primary),
                borderRadius: BorderRadius.circular(20)),
            tabs: [
              Tab(
                height: 40,
                child: Text('Đã đặt',
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
          ),
        ),
      ),
      body: TabBarView(
        controller: historyController.tabController,
        children: const [
          HistoryPaidTicket(),
          HistoryCanceledTicket(),
        ],
      ),
    );
  }
}
