import '../../data/models/consultation_model.dart';

abstract class ConsultationRepository {
  Future<List<ConsultationModel>> getConsultations();
  Future<ConsultationModel> getConsultationDetails(String id);
  Future<ConsultationModel> startConsultation(Map<String, dynamic> data);
  Future<void> sendMessage(String consultationId, String message);
  Future<void> rateConsultation(String consultationId, double rating, String? review);
}
