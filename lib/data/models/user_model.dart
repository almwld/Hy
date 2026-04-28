import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String? profileImage;
  final String? bloodType;
  final double? weight;
  final double? height;
  final List<String>? allergies;
  final List<String>? chronicDiseases;
  final String? subscriptionType;
  final DateTime? subscriptionExpiry;
  final int points;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.profileImage,
    this.bloodType,
    this.weight,
    this.height,
    this.allergies,
    this.chronicDiseases,
    this.subscriptionType,
    this.subscriptionExpiry,
    this.points = 0,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
