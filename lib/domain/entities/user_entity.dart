class UserEntity {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String? profileImage;
  final String? bloodType;
  final double? weight;
  final double? height;
  final List<String>? allergies;
  final List<String>? chronicDiseases;
  final String? subscriptionType;
  final DateTime? subscriptionExpiry;
  final int points;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.profileImage,
    this.bloodType,
    this.weight,
    this.height,
    this.allergies,
    this.chronicDiseases,
    this.subscriptionType,
    this.subscriptionExpiry,
    this.points = 0,
  });
}
