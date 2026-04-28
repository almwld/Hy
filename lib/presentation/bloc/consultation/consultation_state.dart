import '../../../data/models/consultation_model.dart';

abstract class ConsultationState {}

class ConsultationInitial extends ConsultationState {}

class ConsultationLoading extends ConsultationState {}

class ConsultationsLoaded extends ConsultationState {
  final List<ConsultationModel> consultations;
  ConsultationsLoaded(this.consultations);
}

class ConsultationDetailsLoaded extends ConsultationState {
  final ConsultationModel consultation;
  ConsultationDetailsLoaded(this.consultation);
}

class ConsultationStarted extends ConsultationState {
  final ConsultationModel consultation;
  ConsultationStarted(this.consultation);
}

class MessageSent extends ConsultationState {}

class ConsultationRated extends ConsultationState {}

class ConsultationError extends ConsultationState {
  final String message;
  ConsultationError(this.message);
}
