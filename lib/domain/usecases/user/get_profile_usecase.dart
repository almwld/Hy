import '../../repositories/user_repository.dart';
import '../../../data/models/user_model.dart';

class GetProfileUseCase {
  final UserRepository _repository;

  GetProfileUseCase(this._repository);

  Future<UserModel> call() async {
    return await _repository.getProfile();
  }
}
