import '../../domain/repositories/consultation_repository.dart';
import '../datasources/remote/consultation_api.dart';
import '../models/consultation_model.dart';

class ConsultationRepositoryImpl implements ConsultationRepository {
  final ConsultationApi _consultationApi;

  ConsultationRepositoryImpl(this._consultationApi);

  @override
  Future<List<ConsultationModel>> getConsultations() async {
    return await _consultationApi.getConsultations();
  }

  @override
  Future<ConsultationModel> getConsultationDetails(String id) async {
    return await _consultationApi.getConsultationDetails(id);
  }

  @override
  Future<ConsultationModel> startConsultation(Map<String, dynamic> data) async {
    return await _consultationApi.startConsultation(data);
  }

  @override
  Future<void> sendMessage(String consultationId, String message) async {
    await _consultationApi.sendMessage(consultationId, message);
  }

  @override
  Future<void> rateConsultation(String consultationId, double rating, String? review) async {
    await _consultationApi.rateConsultation(consultationId, rating, review);
  }
}
