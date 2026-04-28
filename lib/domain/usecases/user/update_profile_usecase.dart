import '../../repositories/user_repository.dart';
import '../../../data/models/user_model.dart';

class UpdateProfileUseCase {
  final UserRepository _repository;

  UpdateProfileUseCase(this._repository);

  Future<UserModel> call(Map<String, dynamic> data) async {
    return await _repository.updateProfile(data);
  }
}
