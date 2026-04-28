import '../../repositories/consultation_repository.dart';
import '../../../data/models/consultation_model.dart';

class GetConsultationsUseCase {
  final ConsultationRepository _repository;

  GetConsultationsUseCase(this._repository);

  Future<List<ConsultationModel>> call() async {
    return await _repository.getConsultations();
  }
}
