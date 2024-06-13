class Rule {
  String id;
  int minFlightTime;
  int maxNumOfTransitAirport;
  int maxTransitTime;
  int latestTimeForBooking;
  int deadlineForCancelingTicket;

  Rule({
    required this.id,
    required this.minFlightTime,
    required this.maxNumOfTransitAirport,
    required this.maxTransitTime,
    required this.latestTimeForBooking,
    required this.deadlineForCancelingTicket,
  });

  factory Rule.fromJson(Map<String, dynamic> json) {
    return Rule(
      id: json['_id'],
      minFlightTime: json['minFlightTime'],
      maxNumOfTransitAirport: json['maxNumOfTransitAirport'],
      maxTransitTime: json['maxTransitTime'],
      latestTimeForBooking: json['latestTimeForBooking'],
      deadlineForCancelingTicket: json['deadlineForCancelingTicket'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'minFlightTime': minFlightTime,
      'maxNumOfTransitAirport': maxNumOfTransitAirport,
      'maxTransitTime': maxTransitTime,
      'latestTimeForBooking': latestTimeForBooking,
      'deadlineForCancelingTicket': deadlineForCancelingTicket,
    };
  }
}
