import 'package:json_annotation/json_annotation.dart';

part 'doctor_model.g.dart';

@JsonSerializable()
class DoctorModel {
  final String id;
  final String name;
  final String specialty;
  final String? imageUrl;
  final double rating;
  final int reviewsCount;
  final String experience;
  final String clinicAddress;
  final double consultationPrice;
  final List<String> availableDays;
  final List<String> workingHours;
  final bool isAvailableToday;

  DoctorModel({
    required this.id,
    required this.name,
    required this.specialty,
    this.imageUrl,
    required this.rating,
    required this.reviewsCount,
    required this.experience,
    required this.clinicAddress,
    required this.consultationPrice,
    required this.availableDays,
    required this.workingHours,
    required this.isAvailableToday,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) => _$DoctorModelFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorModelToJson(this);
}
