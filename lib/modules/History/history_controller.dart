import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moonair/core/app_colors.dart';
import 'package:moonair/core/values/api_url.dart';
import 'package:moonair/data/models/flightInHistory.dart';
import 'package:moonair/data/services/data_center.dart';
import 'package:moonair/data/services/http_service.dart';
import 'package:moonair/routes/app_route.dart';

class HistoryController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  RxList<BoughtTicket> paidTickets = <BoughtTicket>[].obs;
  RxList<BoughtTicket> canceledTickets = <BoughtTicket>[].obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    fetchHistory();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  // kiem tra co the huy ve khong
  bool canCancelTicket(DateTime takeoffTime, int deadlineForCancelingTicket) {
    DateTime now = DateTime.now();
    Duration difference = takeoffTime.difference(now);
    int differenceInMinutes = difference.inMinutes;

    return differenceInMinutes > deadlineForCancelingTicket;
  }

  Future<void> fetchHistory() async {
    try {
      canceledTickets = <BoughtTicket>[].obs;
      paidTickets = <BoughtTicket>[].obs;
      final url = "${UrlValue.history}/${DataCenter.user!.id}";
      final response = await HttpService.getRequest(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['status'] == 'success') {
          var docs = data['data'] as List;
          docs.forEach((e) {
            BoughtTicket t = BoughtTicket.fromJson(e);
            if (t.status == true) {
              paidTickets.add(t);
            } else {
              canceledTickets.add(t);
            }
          });
        }
        print(paidTickets.length);
        print(canceledTickets.length);
      } else {
        print('Failed to load history');
        print(response.body);
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void navigateToDetailInfo(BoughtTicket ticket) {
    Get.toNamed(AppRoutes.ticketDetail, arguments: ticket);
  }

  Future<void> cancelOneTicket({context, id}) async {
    try {
      final url = '${UrlValue.cancelTicket}/${id}';
      var response = await HttpService.deleteRequest(url: url);
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            "Hủy vé thành công.",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: AppColors.primary,
        ));
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Hủy vé không thành công. Vui lòng thử lại.",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.greenAccent,
      ));
    } finally {
      await fetchHistory();
      Get.back();
    }
  }
}
