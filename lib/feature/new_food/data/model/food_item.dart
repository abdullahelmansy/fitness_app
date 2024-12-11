import 'package:equatable/equatable.dart';

class FoodItem extends Equatable {
  final String id;
  final String name;
  final int calories;
  final int protein;
  final int fat;
  final int carbs;

  const FoodItem({
    required this.id,
    required this.name,
    required this.calories,
    required this.protein,
    required this.fat,
    required this.carbs,
  });

  @override
  List<Object> get props => [id, name, calories, protein, fat, carbs];

  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
      id: json['id'],
      name: json['name'],
      calories: json['calories'],
      protein: json['protein'],
      fat: json['fat'],
      carbs: json['carbs'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'calories': calories,
      'protein': protein,
      'fat': fat,
      'carbs': carbs,
    };
  }
}
