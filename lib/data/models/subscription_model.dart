import 'package:json_annotation/json_annotation.dart';

part 'subscription_model.g.dart';

enum SubscriptionType { basic, standard, premium }

@JsonSerializable()
class SubscriptionModel {
  final String id;
  final String userId;
  final SubscriptionType type;
  final DateTime startDate;
  final DateTime expiryDate;
  final double price;
  final int consultationsLimit;
  final bool includesPharmacyDelivery;
  final bool includesVideoCalls;
  final bool includesAiAssistant;
  final bool isActive;

  SubscriptionModel({
    required this.id,
    required this.userId,
    required this.type,
    required this.startDate,
    required this.expiryDate,
    required this.price,
    required this.consultationsLimit,
    required this.includesPharmacyDelivery,
    required this.includesVideoCalls,
    required this.includesAiAssistant,
    this.isActive = true,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) => _$SubscriptionModelFromJson(json);
  Map<String, dynamic> toJson() => _$SubscriptionModelToJson(this);
}
