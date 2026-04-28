import '../../repositories/auth_repository.dart';
import '../../../data/models/user_model.dart';

class RegisterUseCase {
  final AuthRepository _repository;

  RegisterUseCase(this._repository);

  Future<UserModel> call(String name, String email, String password, String phone) async {
    return await _repository.register(name, email, password, phone);
  }
}
