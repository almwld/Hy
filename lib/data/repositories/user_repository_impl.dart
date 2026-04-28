import '../../domain/repositories/user_repository.dart';
import '../datasources/remote/user_api.dart';
import '../datasources/local/storage_service.dart';
import '../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApi _userApi;
  final StorageService _storage;

  UserRepositoryImpl(this._userApi, this._storage);

  @override
  Future<UserModel> getProfile() async {
    return await _userApi.getProfile();
  }

  @override
  Future<UserModel> updateProfile(Map<String, dynamic> data) async {
    final user = await _userApi.updateProfile(data);
    await _storage.setUser(user.toJson());
    return user;
  }

  @override
  Future<List<dynamic>> getMedicalHistory() async {
    return await _userApi.getMedicalHistory();
  }
}
