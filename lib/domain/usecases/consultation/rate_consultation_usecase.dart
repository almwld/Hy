import '../../repositories/consultation_repository.dart';

class RateConsultationUseCase {
  final ConsultationRepository _repository;

  RateConsultationUseCase(this._repository);

  Future<void> call(String consultationId, double rating, String? review) async {
    return await _repository.rateConsultation(consultationId, rating, review);
  }
}
