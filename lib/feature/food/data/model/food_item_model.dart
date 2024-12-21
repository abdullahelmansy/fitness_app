// models/nutrition_model.dart
class NutritionModel {
  final String foodName;
  final double calories;
  final double protein;
  final double carbs;
  final double fat;
  final Photo photo;

  NutritionModel({
    required this.photo,
    required this.foodName,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
  });

  factory NutritionModel.fromJson(Map<String, dynamic> json) {
    return NutritionModel(
      foodName: json['food_name'],
      calories: json['nf_calories']?.toDouble() ?? 0.0,
      protein: json['nf_protein']?.toDouble() ?? 0.0,
      carbs: json['nf_total_carbohydrate']?.toDouble() ?? 0.0,
      fat: json['nf_total_fat']?.toDouble() ?? 0.0,
      photo: Photo.fromJson(json['photo'] as Map<String, dynamic>),
    );
  }
}

class Photo {
  String? thumb;
  dynamic highres;
  bool? isUserUploaded;

  Photo({this.thumb, this.highres, this.isUserUploaded});

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        thumb: json['thumb'] as String?,
        highres: json['highres'] as dynamic,
        isUserUploaded: json['is_user_uploaded'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'thumb': thumb,
        'highres': highres,
        'is_user_uploaded': isUserUploaded,
      };
}
