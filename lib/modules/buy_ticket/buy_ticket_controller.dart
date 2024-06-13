import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:moonair/core/values/api_url.dart';
import 'package:moonair/data/models/flight.dart';
import 'package:moonair/data/services/data_center.dart';
import 'package:moonair/data/services/http_service.dart';
import 'package:moonair/routes/app_route.dart';
import 'package:intl/intl.dart';
import '../../data/models/invoice.dart';
import '../history/history_controller.dart';

class BuyTicketController extends GetxController {
  final fromAirportId = ''.obs;
  final toAirportId = ''.obs;
  final departureDate = ''.obs;
  final returnDate = ''.obs;
  final isReturnFlight = false.obs;
  final seat = ''.obs;

  Rx<int> currentTicketIndex = 0.obs;
  RxList<Flight> flights = <Flight>[].obs;
  Rx<Ticket?> currentTicketClass = Rx<Ticket?>(null);
  Rx<Flight?> currentFlight = Rx<Flight?>(null);
  Rx<String> currentChooseSeats = ''.obs;
  Rx<double> currentTotal = 0.0.obs;

  //current passenger
  final usernameController = TextEditingController().obs;
  final phonenumberController = TextEditingController().obs;
  final dateofBirthController = TextEditingController().obs;

  //create invoice
  Future<void> createInvoice() async {
    HistoryController historyController = Get.find();
    // Tạo đối tượng BoughtTicket
    //currentTicketClass.value?.chooseSeatsPasInfo?[seat] = passenger;
    List<BoughtTicket> boughtTickets = [];
    currentTicketClass.value?.chooseSeats?.forEach((seat) {
      Passenger p = currentTicketClass.value!.chooseSeatsPasInfo![seat]!;
      BoughtTicket t = BoughtTicket(
        status: true,
        price: currentTicketClass.value!.ratio * currentFlight.value!.price,
        dateOfBirth: p.dateOfBirth.toIso8601String(),
        phoneNumber: p.phoneNumber,
        passengerName: p.passengerName,
        seatNo: seat,
        ticketClass: currentTicketClass.value!.id,
        flight: currentFlight.value!.id,
      );
      boughtTickets.add(t);
    });

    // Tạo đối tượng Invoice
    Invoice invoice = Invoice(
      user: DataCenter.user!.id,
      total: currentTotal.value,
      boughtTickets: boughtTickets,
    );
    try {
      var response = await HttpService.postRequest(
          url: UrlValue.invoices, body: jsonEncode(invoice.toJson()));
      if (response.statusCode == 200) {
        print('Invoice created successfully.');
        historyController.fetchHistory();
      } else {
        print(response.body);
      }
    } catch (error) {
      print(error);
    }
  }

  //passenger
  void updatePassengerInfo(int seat) {
    // Extract text values from controllers
    String passengerName = usernameController.value.text;
    String phoneNumber = phonenumberController.value.text;
    DateTime dateOfBirth =
        DateFormat('dd/MM/yyyy').parse(dateofBirthController.value.text);

    // Create Passenger object
    Passenger passenger = Passenger(
      passengerName: passengerName,
      phoneNumber: phoneNumber,
      dateOfBirth: dateOfBirth,
    );
    currentTicketClass.value?.chooseSeatsPasInfo?[seat] = passenger;

    usernameController.value.text = '';
    phonenumberController.value.text = '';
    dateofBirthController.value.text = '';
  }

  void printChooseSeatsInfo(Ticket ticket) {
    if (ticket.chooseSeatsPasInfo != null) {
      print('Choose Seats Info for Ticket ${ticket.id}:');

      ticket.chooseSeatsPasInfo!.forEach((seat, passenger) {
        if (passenger != null) {
          print(
              'Seat $seat: ${passenger.passengerName}, ${passenger.phoneNumber}, ${passenger.dateOfBirth}');
        } else {
          print('Seat $seat: No passenger info available');
        }
      });
    } else {
      print('No chooseSeatsPasInfo available for Ticket ${ticket.id}');
    }
  }

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

      for (var t in tickets) {
        Ticket temp = Ticket.fromJson(t);

        result.add(temp);
      }
      print('Tickets: ${result.length}');

      return result;
    } catch (error) {
      print(error);
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
