import 'package:moonair/data/models/flight.dart';

class FlightHistory {
  final String id;
  final Airport departureAirport;
  final Airport destinationAirport;
  final DateTime takeoffTime;
  final DateTime landingTime;
  final List<TransitAirport> transitAirports;
  final String code;
  final int duration;
  final int availableSeats;

  FlightHistory({
    required this.id,
    required this.departureAirport,
    required this.destinationAirport,
    required this.takeoffTime,
    required this.landingTime,
    required this.transitAirports,
    required this.code,
    required this.duration,
    required this.availableSeats,
  });

  factory FlightHistory.fromJson(Map<String, dynamic> json) {
    return FlightHistory(
        id: json['_id'],
        departureAirport: Airport.fromJson(json['departureAirport']),
        destinationAirport: Airport.fromJson(json['destinationAirport']),
        takeoffTime: DateTime.parse(json['takeoffTime']),
        landingTime: DateTime.parse(json['landingTime']),
        code: json['code'],
        duration: json['duration'],
        availableSeats: json['availableSeats'],
        transitAirports: json['transitAirports'] != null
            ? (json['transitAirports'] as List<dynamic>)
                .map(
                    (transitAirport) => TransitAirport.fromJson(transitAirport))
                .toList()
            : []);
  }
}

class TicketClassHistory {
  final String id;
  final String name;

  TicketClassHistory({
    required this.id,
    required this.name,
  });

  factory TicketClassHistory.fromJson(Map<String, dynamic> json) {
    return TicketClassHistory(
      id: json['_id'],
      name: json['name'],
    );
  }
}

class BoughtTicket {
  final FlightHistory? flight;
  final TicketClassHistory? ticketClass;
  final int seatNo;
  final String passengerName;
  final String phoneNumber;
  final DateTime dateOfBirth;
  final int price;
  final bool status;
  final String id;
  final String code;

  BoughtTicket({
    required this.flight,
    required this.ticketClass,
    required this.seatNo,
    required this.passengerName,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.price,
    required this.status,
    required this.id,
    required this.code,
  });

  factory BoughtTicket.fromJson(Map<String, dynamic> json) {
    return BoughtTicket(
      flight: json['flight'] != null
          ? FlightHistory.fromJson(json['flight'])
          : null,
      ticketClass: json['ticketClass'] != null
          ? TicketClassHistory.fromJson(json['ticketClass'])
          : null,
      seatNo: json['seatNo'],
      passengerName: json['passengerName'],
      phoneNumber: json['phoneNumber'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      price: json['price'],
      status: json['status'],
      id: json['_id'],
      code: json['code'],
    );
  }
}
