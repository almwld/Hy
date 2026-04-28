import '../../repositories/auth_repository.dart';
import '../../../data/models/user_model.dart';

class LoginUseCase {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  Future<UserModel> call(String email, String password) async {
    return await _repository.login(email, password);
  }
}
