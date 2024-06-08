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
      nameMinPrice: json['nameMinPrice'],
      transitAirports: (json['transitAirports'] as List<dynamic>)
          .map((transitAirport) => TransitAirport.fromJson(transitAirport))
          .toList(),
      tickets: json['tickets'] != null
          ? (json['tickets'] as List<dynamic>)
              .map((ticket) => Ticket.fromJson(ticket))
              .toList()
          : null,
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

class Ticket {
  final String id;
  final String className;
  final int numOfTickets;
  final List<String> seatsBooked;

  Ticket({
    required this.id,
    required this.className,
    required this.numOfTickets,
    required this.seatsBooked,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      id: json['class']['_id'],
      className: json['class']['name'],
      numOfTickets: json['numOfTic'],
      seatsBooked: List<String>.from(json['seatsBooked']),
    );
  }
}
