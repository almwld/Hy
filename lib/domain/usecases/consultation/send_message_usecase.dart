import '../../repositories/consultation_repository.dart';

class SendMessageUseCase {
  final ConsultationRepository _repository;

  SendMessageUseCase(this._repository);

  Future<void> call(String consultationId, String message) async {
    return await _repository.sendMessage(consultationId, message);
  }
}
