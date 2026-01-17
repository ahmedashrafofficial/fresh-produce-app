class Neighborhood {
  final String id;
  final String name;
  final String city;
  final double deliveryFee;
  final String? pickupPointAddress;
  final String? pickupPointNotes;

  Neighborhood({
    required this.id,
    required this.name,
    required this.city,
    this.deliveryFee = 20.0,
    this.pickupPointAddress,
    this.pickupPointNotes,
  });
}
