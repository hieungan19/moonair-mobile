class Airport {
  final String id;
  final String name;
  final String city;

  Airport({required this.id, required this.name, required this.city});
  @override
  String toString() {
    return '$name - $city';
  }

  factory Airport.fromJson(Map<String, dynamic> json) {
    return Airport(
      id: json['_id'],
      name: json['name'],
      city: json['city'],
    );
  }
}
