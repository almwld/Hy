import 'package:json_annotation/json_annotation.dart';

part 'consultation_model.g.dart';

enum ConsultationStatus { pending, active, completed, cancelled }

@JsonSerializable()
class ConsultationModel {
  final String id;
  final String doctorId;
  final String doctorName;
  final String? doctorImage;
  final String patientId;
  final String patientName;
  final DateTime date;
  final String time;
  final ConsultationStatus status;
  final String? notes;
  final double? price;
  final String? prescription;
  final double? rating;
  final String? review;
  final List<MessageModel>? messages;

  ConsultationModel({
    required this.id,
    required this.doctorId,
    required this.doctorName,
    this.doctorImage,
    required this.patientId,
    required this.patientName,
    required this.date,
    required this.time,
    this.status = ConsultationStatus.pending,
    this.notes,
    this.price,
    this.prescription,
    this.rating,
    this.review,
    this.messages,
  });

  factory ConsultationModel.fromJson(Map<String, dynamic> json) => _$ConsultationModelFromJson(json);
  Map<String, dynamic> toJson() => _$ConsultationModelToJson(this);
}

@JsonSerializable()
class MessageModel {
  final String id;
  final String senderId;
  final String senderName;
  final String content;
  final DateTime timestamp;
  final String type;

  MessageModel({
    required this.id,
    required this.senderId,
    required this.senderName,
    required this.content,
    required this.timestamp,
    this.type = 'text',
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => _$MessageModelFromJson(json);
  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}
