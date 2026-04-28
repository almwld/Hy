class DoctorModel {
  final String id;
  final String name;
  final String specialty;
  final String? imageUrl;
  final double rating;
  final int reviewsCount;
  final String experience;
  final double consultationPrice;
  
  DoctorModel({
    required this.id,
    required this.name,
    required this.specialty,
    this.imageUrl,
    required this.rating,
    required this.reviewsCount,
    required this.experience,
    required this.consultationPrice,
  });
  
  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'] as String,
      name: json['name'] as String,
      specialty: json['specialty'] as String,
      imageUrl: json['imageUrl'] as String?,
      rating: (json['rating'] as num).toDouble(),
      reviewsCount: json['reviewsCount'] as int,
      experience: json['experience'] as String,
      consultationPrice: (json['consultationPrice'] as num).toDouble(),
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'specialty': specialty,
      'imageUrl': imageUrl,
      'rating': rating,
      'reviewsCount': reviewsCount,
      'experience': experience,
      'consultationPrice': consultationPrice,
    };
  }
}
