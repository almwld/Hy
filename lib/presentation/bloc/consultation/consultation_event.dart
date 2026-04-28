abstract class ConsultationEvent {}

class GetConsultationsEvent extends ConsultationEvent {}

class GetConsultationDetailsEvent extends ConsultationEvent {
  final String id;
  GetConsultationDetailsEvent(this.id);
}

class StartConsultationEvent extends ConsultationEvent {
  final Map<String, dynamic> data;
  StartConsultationEvent(this.data);
}

class SendMessageEvent extends ConsultationEvent {
  final String consultationId;
  final String message;
  SendMessageEvent(this.consultationId, this.message);
}

class RateConsultationEvent extends ConsultationEvent {
  final String consultationId;
  final double rating;
  final String? review;
  RateConsultationEvent(this.consultationId, this.rating, this.review);
}
