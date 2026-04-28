import '../../data/models/user_model.dart';

abstract class UserRepository {
  Future<UserModel> getProfile();
  Future<UserModel> updateProfile(Map<String, dynamic> data);
  Future<List<dynamic>> getMedicalHistory();
}
