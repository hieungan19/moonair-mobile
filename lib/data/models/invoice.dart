class Invoice {
  final String user;
  final double total;
  final List<BoughtTicket> boughtTickets;

  Invoice({
    required this.user,
    required this.total,
    required this.boughtTickets,
  });

  Map<String, dynamic> toJson() {
    return {
      'user': user,
      'total': total,
      'boughtTickets': boughtTickets.map((ticket) => ticket.toJson()).toList(),
    };
  }
}

class BoughtTicket {
  final bool status;
  final double price;
  final String dateOfBirth;
  final String phoneNumber;
  final String passengerName;
  final int seatNo;
  final String ticketClass;
  final String flight;

  BoughtTicket({
    required this.status,
    required this.price,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.passengerName,
    required this.seatNo,
    required this.ticketClass,
    required this.flight,
  });

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'price': price,
      'dateOfBirth': dateOfBirth,
      'phoneNumber': phoneNumber,
      'passengerName': passengerName,
      'seatNo': seatNo,
      'ticketClass': ticketClass,
      'flight': flight,
    };
  }
}
