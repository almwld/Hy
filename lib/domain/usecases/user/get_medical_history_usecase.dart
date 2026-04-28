import '../../repositories/user_repository.dart';

class GetMedicalHistoryUseCase {
  final UserRepository _repository;

  GetMedicalHistoryUseCase(this._repository);

  Future<List<dynamic>> call() async {
    return await _repository.getMedicalHistory();
  }
}
