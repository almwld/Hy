class ConsultationEntity {
  final String id;
  final String doctorId;
  final String doctorName;
  final String? doctorImage;
  final String patientId;
  final String patientName;
  final DateTime date;
  final String time;
  final String status;
  final String? notes;
  final double? price;
  final String? prescription;
  final double? rating;
  final String? review;

  ConsultationEntity({
    required this.id,
    required this.doctorId,
    required this.doctorName,
    this.doctorImage,
    required this.patientId,
    required this.patientName,
    required this.date,
    required this.time,
    required this.status,
    this.notes,
    this.price,
    this.prescription,
    this.rating,
    this.review,
  });
}
