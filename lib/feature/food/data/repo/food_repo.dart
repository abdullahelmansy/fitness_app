// repositories/nutrition_repository.dart
import 'package:dio/dio.dart';
import 'package:new_project/feature/food/data/model/food_item_model.dart';

class NutritionRepository {
  NutritionRepository();

  static Future<List<NutritionModel>> fetchNutritionData(
      String query, String appId, String appKey) async {
    final response = await Dio().post(
      'https://trackapi.nutritionix.com/v2/natural/nutrients',
      options: Options(headers: {
        'x-app-id': appId,
        'x-app-key': appKey,
      }),
      data: {'query': query},
    );

    final foods = response.data['foods'] as List;
    return foods.map((food) => NutritionModel.fromJson(food)).toList();
  }
}
