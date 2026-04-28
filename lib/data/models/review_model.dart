import 'package:json_annotation/json_annotation.dart';

part 'review_model.g.dart';

@JsonSerializable()
class ReviewModel {
  final String id;
  final String doctorId;
  final String patientId;
  final String patientName;
  final double rating;
  final String comment;
  final DateTime date;
  final String? consultationId;

  ReviewModel({
    required this.id,
    required this.doctorId,
    required this.patientId,
    required this.patientName,
    required this.rating,
    required this.comment,
    required this.date,
    this.consultationId,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) => _$ReviewModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);
}
