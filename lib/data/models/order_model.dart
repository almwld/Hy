import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

enum OrderStatus { pending, confirmed, preparing, shipped, delivered, cancelled }

@JsonSerializable()
class OrderModel {
  final String id;
  final String pharmacyId;
  final String pharmacyName;
  final List<OrderItem> items;
  final double totalPrice;
  final double deliveryFee;
  final OrderStatus status;
  final DateTime createdAt;
  final DateTime? deliveredAt;
  final String address;
  final String? trackingNumber;

  OrderModel({
    required this.id,
    required this.pharmacyId,
    required this.pharmacyName,
    required this.items,
    required this.totalPrice,
    required this.deliveryFee,
    this.status = OrderStatus.pending,
    required this.createdAt,
    this.deliveredAt,
    required this.address,
    this.trackingNumber,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}

@JsonSerializable()
class OrderItem {
  final String productId;
  final String productName;
  final int quantity;
  final double price;
  final String? imageUrl;

  OrderItem({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.price,
    this.imageUrl,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => _$OrderItemFromJson(json);
  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}
