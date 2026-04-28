import '../../repositories/consultation_repository.dart';
import '../../../data/models/consultation_model.dart';

class GetConsultationDetailsUseCase {
  final ConsultationRepository _repository;

  GetConsultationDetailsUseCase(this._repository);

  Future<ConsultationModel> call(String id) async {
    return await _repository.getConsultationDetails(id);
  }
}
