class Flight {
  final String id;
  final Airport departureAirport;
  final Airport destinationAirport;
  final DateTime takeoffTime;
  final DateTime landingTime;
  final int duration;
  final int availableSeats;
  final String flightCode;
  final int transitAirportCount;
  final String aircraftName;
  final int minPrice;
  final String nameMinPrice;
  final int price;
  final List<TransitAirport> transitAirports;
  List<Ticket>? tickets; // Cho phép null

  Flight({
    required this.id,
    required this.departureAirport,
    required this.destinationAirport,
    required this.takeoffTime,
    required this.landingTime,
    required this.duration,
    required this.availableSeats,
    required this.flightCode,
    required this.transitAirportCount,
    required this.aircraftName,
    required this.minPrice,
    required this.nameMinPrice,
    required this.transitAirports,
    required this.price,
    this.tickets,
  });

  // Phương thức để thay đổi danh sách tickets
  void updateTickets(List<Ticket>? newTickets) {
    tickets = newTickets;
  }

  factory Flight.fromJson(Map<String, dynamic> json) {
    return Flight(
      id: json['_id'],
      departureAirport: Airport.fromJson(json['departureAirport']),
      destinationAirport: Airport.fromJson(json['destinationAirport']),
      takeoffTime: DateTime.parse(json['takeoffTime']),
      landingTime: DateTime.parse(json['landingTime']),
      duration: json['duration'],
      availableSeats: json['availableSeats'],
      flightCode: json['flightCode'],
      transitAirportCount: json['transitAirportCount'],
      aircraftName: json['aircraftName'],
      minPrice: json['minPrice'],
      price: json['price'],
      nameMinPrice: json['nameMinPrice'],
      transitAirports: json['transitAiports'] != null
          ? (json['transitAiports'] as List<dynamic>)
              .map((transitAirport) => TransitAirport.fromJson(transitAirport))
              .toList()
          : [],
    );
  }
}

class Airport {
  final String name;
  final String city;
  final String country;
  final String cityCode;

  Airport({
    required this.name,
    required this.city,
    required this.country,
    required this.cityCode,
  });

  factory Airport.fromJson(Map<String, dynamic> json) {
    return Airport(
      name: json['name'],
      city: json['city'],
      country: json['country'] ?? "",
      cityCode: json['cityCode'],
    );
  }
}

class TransitAirport {
  final String id;
  final Airport airport;
  final DateTime transitStartTime;
  final DateTime transitEndTime;
  final int duration;

  TransitAirport({
    required this.id,
    required this.airport,
    required this.transitStartTime,
    required this.transitEndTime,
    required this.duration,
  });

  factory TransitAirport.fromJson(Map<String, dynamic> json) {
    return TransitAirport(
      id: json['_id'],
      airport: Airport.fromJson(json['airport']),
      transitStartTime: DateTime.parse(json['transitStartTime']),
      transitEndTime: DateTime.parse(json['transitEndTime']),
      duration: json['duration'],
    );
  }
}

class Passenger {
  String passengerName;
  String phoneNumber;
  DateTime dateOfBirth;

  Passenger({
    required this.passengerName,
    required this.phoneNumber,
    required this.dateOfBirth,
  });

  // Optional: Add a factory constructor to create a Passenger from a Map (for example, if you're parsing JSON data)
  factory Passenger.fromMap(Map<String, dynamic> map) {
    return Passenger(
      passengerName: map['passengerName'],
      phoneNumber: map['phoneNumber'],
      dateOfBirth: DateTime.parse(map['dateOfBirth']),
    );
  }
}

class Ticket {
  final String id;
  final String className;
  final int numOfTickets;
  final List<int> seatsBooked;
  final double ratio;
  List<int>? chooseSeats;
  Map<int, Passenger>? chooseSeatsPasInfo;
  Ticket(
      {required this.id,
      required this.className,
      required this.numOfTickets,
      required this.seatsBooked,
      required this.ratio,
      List<int>? chooseSeats,
      Map<int, Passenger>? chooseSeatsPasInfo})
      : chooseSeats = chooseSeats ?? [],
        chooseSeatsPasInfo = chooseSeatsPasInfo ?? {};

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
        id: json['class']['_id'],
        className: json['class']['name'],
        ratio: json['class'] != null && json['class']['ratio'] != null
            ? (json['class']['ratio'] as num).toDouble()
            : 0.0,
        numOfTickets: json['numOfTic'],
        seatsBooked: List<int>.from(json['seatsBooked']),
        chooseSeatsPasInfo: {});
  }
}
