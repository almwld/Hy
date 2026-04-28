import 'package:json_annotation/json_annotation.dart';

part 'schedule_model.g.dart';

@JsonSerializable()
class ScheduleModel {
  final String id;
  final String doctorId;
  final DateTime date;
  final String startTime;
  final String endTime;
  final bool isAvailable;
  final String? consultationId;

  ScheduleModel({
    required this.id,
    required this.doctorId,
    required this.date,
    required this.startTime,
    required this.endTime,
    this.isAvailable = true,
    this.consultationId,
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> json) => _$ScheduleModelFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleModelToJson(this);
}
