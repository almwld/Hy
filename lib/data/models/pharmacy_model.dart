import 'package:json_annotation/json_annotation.dart';

part 'pharmacy_model.g.dart';

@JsonSerializable()
class PharmacyModel {
  final String id;
  final String name;
  final String address;
  final double? latitude;
  final double? longitude;
  final double rating;
  final bool isOpen;
  final String phone;
  final String? imageUrl;

  PharmacyModel({
    required this.id,
    required this.name,
    required this.address,
    this.latitude,
    this.longitude,
    required this.rating,
    required this.isOpen,
    required this.phone,
    this.imageUrl,
  });

  factory PharmacyModel.fromJson(Map<String, dynamic> json) => _$PharmacyModelFromJson(json);
  Map<String, dynamic> toJson() => _$PharmacyModelToJson(this);
}
