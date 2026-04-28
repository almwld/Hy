import 'package:json_annotation/json_annotation.dart';

part 'prescription_model.g.dart';

@JsonSerializable()
class PrescriptionModel {
  final String id;
  final String consultationId;
  final String doctorId;
  final String doctorName;
  final String patientId;
  final String patientName;
  final DateTime date;
  final String diagnosis;
  final List<MedicationModel> medications;
  final String? notes;

  PrescriptionModel({
    required this.id,
    required this.consultationId,
    required this.doctorId,
    required this.doctorName,
    required this.patientId,
    required this.patientName,
    required this.date,
    required this.diagnosis,
    required this.medications,
    this.notes,
  });

  factory PrescriptionModel.fromJson(Map<String, dynamic> json) => _$PrescriptionModelFromJson(json);
  Map<String, dynamic> toJson() => _$PrescriptionModelToJson(this);
}

@JsonSerializable()
class MedicationModel {
  final String name;
  final String dosage;
  final String frequency;
  final String duration;
  final String? instructions;

  MedicationModel({
    required this.name,
    required this.dosage,
    required this.frequency,
    required this.duration,
    this.instructions,
  });

  factory MedicationModel.fromJson(Map<String, dynamic> json) => _$MedicationModelFromJson(json);
  Map<String, dynamic> toJson() => _$MedicationModelToJson(this);
}
