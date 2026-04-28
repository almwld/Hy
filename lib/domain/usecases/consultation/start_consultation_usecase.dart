import '../../repositories/consultation_repository.dart';
import '../../../data/models/consultation_model.dart';

class StartConsultationUseCase {
  final ConsultationRepository _repository;

  StartConsultationUseCase(this._repository);

  Future<ConsultationModel> call(Map<String, dynamic> data) async {
    return await _repository.startConsultation(data);
  }
}
