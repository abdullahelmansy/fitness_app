// bloc/nutrition_event.dart
abstract class NutritionEvent {}

class FetchNutritionData extends NutritionEvent {
  final String query;

  FetchNutritionData(this.query);
}
