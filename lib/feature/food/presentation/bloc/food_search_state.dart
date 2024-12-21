// bloc/nutrition_state.dart
import 'package:new_project/feature/food/data/model/food_item_model.dart';

abstract class NutritionState {}

class NutritionInitial extends NutritionState {}

class NutritionLoading extends NutritionState {}

class NutritionLoaded extends NutritionState {
  final List<NutritionModel> nutritionData;

  NutritionLoaded(this.nutritionData);
}

class NutritionError extends NutritionState {
  final String message;

  NutritionError(this.message);
}
