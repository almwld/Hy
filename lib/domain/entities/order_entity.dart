class OrderEntity {
  final String id;
  final String pharmacyId;
  final String pharmacyName;
  final double totalPrice;
  final double deliveryFee;
  final String status;
  final DateTime createdAt;
  final String address;

  OrderEntity({
    required this.id,
    required this.pharmacyId,
    required this.pharmacyName,
    required this.totalPrice,
    required this.deliveryFee,
    required this.status,
    required this.createdAt,
    required this.address,
  });
}
