import '../../repositories/auth_repository.dart';

class VerifyOtpUseCase {
  final AuthRepository _repository;

  VerifyOtpUseCase(this._repository);

  Future<void> call(String email, String otp) async {
    return await _repository.verifyOtp(email, otp);
  }
}
