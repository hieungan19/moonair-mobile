import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:moonair/core/values/api_url.dart';
import 'package:moonair/data/models/flight.dart';
import 'package:moonair/data/services/data_center.dart';
import 'package:moonair/data/services/http_service.dart';
import 'package:moonair/routes/app_route.dart';

class BuyTicketController extends GetxController {
  final fromAirportId = ''.obs;
  final toAirportId = ''.obs;
  final departureDate = ''.obs;
  final returnDate = ''.obs;
  final isReturnFlight = false.obs;
  final seat = ''.obs;
  RxList<Flight> flights = <Flight>[].obs;
  RxString currentClass = ''.obs;
  RxList<String> currentSeats = <String>[].obs;

  //chat
  void navigateToChatbotScreen() {
    Get.toNamed(AppRoutes.chatbotPage);
  }
  // get all flight
  //{{API_URL}}/flights?fromAirport=6620c3bf8c579631d6d5f1e0&toAirport=6620c3d38c579631d6d5f1e3&takeoffDate=2024-04-19&seats=20

  Future<void> fetchFlights(String fromAirport, String toAirport,
      String takeoffDate, String seats) async {
    print('Fetch Flights');
    final apiUrl =
        '${UrlValue.app}/flights?fromAirport=$fromAirport&toAirport=$toAirport&takeoffDate=$takeoffDate&seats=$seats';

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {'Authorization': 'Bearer ${DataCenter.token}'},
    );

    if (response.statusCode == 200) {
      // Xử lý dữ liệu JSON được trả về từ API
      List<dynamic> data = jsonDecode(response.body);

      for (var flightJson in data) {
        Flight flight = Flight.fromJson(flightJson);
        flights.add(flight);
      }

      // In ra số lượng flights đã lấy được
      print('Fetched ${flights.length} flights');
    } else {
      // Nếu yêu cầu không thành công, in ra lỗi
      throw Exception('Failed to load flights');
    }
  }

  //fetch ticket by id
  Future<List<Ticket>?> fetchOneTicketById(id) async {
    List<Ticket> result = [];
    try {
      final response =
          await HttpService.getRequest("${UrlValue.flights}/${id}");
      var data = jsonDecode(response.body);
      List<dynamic> tickets = data["flight"]["tickets"];
      print(tickets);
      for (var t in tickets) {
        Ticket temp = Ticket.fromJson(t);
        result.add(temp);
      }
      return result;
    } catch (error) {
      return null;
    }
  }

  @override
  void onInit() {
    super.onInit();
    // Extract parameters from the URL
    fromAirportId.value = Get.parameters['fromAirportId'] ?? 'Unknown';
    toAirportId.value = Get.parameters['toAirportId'] ?? 'Unknown';
    departureDate.value = Get.parameters['departureDate'] ?? 'Unknown';
    returnDate.value = Get.parameters['returnDate'] ?? 'Unknown';
    isReturnFlight.value = Get.parameters['isReturnFlight'] == 'true';
    seat.value = Get.parameters['seat'] ?? '0';
    // get all flight by condition

    fetchFlights(fromAirportId.value, toAirportId.value, departureDate.value,
        seat.value);
  }
}
