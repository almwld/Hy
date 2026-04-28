import '../../domain/repositories/auth_repository.dart';
import '../datasources/remote/auth_api.dart';
import '../datasources/local/storage_service.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi _authApi;
  final StorageService _storage;

  AuthRepositoryImpl(this._authApi, this._storage);

  @override
  Future<UserModel> login(String email, String password) async {
    final user = await _authApi.login(email, password);
    await _storage.setUser(user.toJson());
    return user;
  }

  @override
  Future<UserModel> register(String name, String email, String password, String phone) async {
    final user = await _authApi.register(name, email, password, phone);
    await _storage.setUser(user.toJson());
    return user;
  }

  @override
  Future<void> forgotPassword(String email) async {
    await _authApi.forgotPassword(email);
  }

  @override
  Future<void> verifyOtp(String email, String otp) async {
    await _authApi.verifyOtp(email, otp);
  }

  @override
  Future<void> logout() async {
    await _authApi.logout();
    await _storage.clear();
  }

  @override
  Future<bool> isLoggedIn() async {
    return _storage.getToken() != null;
  }
}
