import 'package:json_annotation/json_annotation.dart';

part 'payment_model.g.dart';

enum PaymentStatus { pending, completed, failed, refunded }
enum PaymentMethod { creditCard, mada, applePay, cashOnDelivery }

@JsonSerializable()
class PaymentModel {
  final String id;
  final String userId;
  final String orderId;
  final double amount;
  final PaymentStatus status;
  final PaymentMethod method;
  final DateTime date;
  final String? transactionId;
  final String? cardLastDigits;

  PaymentModel({
    required this.id,
    required this.userId,
    required this.orderId,
    required this.amount,
    this.status = PaymentStatus.pending,
    required this.method,
    required this.date,
    this.transactionId,
    this.cardLastDigits,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) => _$PaymentModelFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentModelToJson(this);
}
