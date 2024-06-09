import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moonair/core/values/api_url.dart';
import 'package:moonair/data/models/airport.dart';
import 'package:moonair/data/services/http_service.dart';
import 'package:moonair/routes/app_route.dart';

class HomeController extends GetxController {
  var airports = <Airport>[].obs;
  var isLoading = false.obs;
  String fromAirportId = '';
  String toAirportId = '';
  RxBool isReturnFlight = false.obs;
  TextEditingController seat = TextEditingController(text: "1");
  late RxString departureDate = DateTime.now().toString().substring(0, 10).obs;
  late RxString returnDate = DateTime.now().toString().substring(0, 10).obs;

  @override
  void onInit() {
    super.onInit();
    fetchAirports();
  }

  Future<void> fetchAirports() async {
    isLoading(true);
    try {
      final response = await HttpService.getRequest(UrlValue.airports);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['status'] == 'success') {
          var docs = data['doc'] as List;
          airports.value = docs.map((doc) => Airport.fromJson(doc)).toList();
        }
      } else {
        print('Failed to load airports');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }

  void navigateToChatbotScreen() {
    Get.toNamed(AppRoutes.chatbotPage);
  }

  void navigateToSearchTicketPage() {
    Get.toNamed(AppRoutes.searchTicket, parameters: {
      'fromAirportId': fromAirportId,
      'toAirportId': toAirportId,
      'isReturnFlight': isReturnFlight.toString(),
      'departureDate': departureDate.value,
      'returnDate': returnDate.value,
      'seat': seat.text
    });
  }
}
