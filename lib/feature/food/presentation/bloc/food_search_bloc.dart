import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'food_search_event.dart';
import 'food_search_state.dart';

class FoodSearchBloc extends Bloc<FoodSearchEvent, FoodSearchState> {
  final Dio _dio;

  FoodSearchBloc(this._dio) : super(FoodSearchInitial()) {
    on<SearchFoodEvent>(_onSearchFood);
  }

  Future<void> _onSearchFood(
      SearchFoodEvent event, Emitter<FoodSearchState> emit) async {
    emit(FoodSearchLoading());
    try {
      final response = await _dio.get(
        'https://trackapi.nutritionix.com/v2/search/instant/',
        queryParameters: {
          'query': event.query,
        },
        options: Options(
          headers: {
            'x-app-id': '060a2464', // Replace with your APP ID
            'x-app-key': '20589b2979fdfea5929cdce58006288a', // Replace with your APP KEY
            'Content-Type': 'application/json',
          },
        ),
      );

      // Extract required fields from the response
      final foods = List<Map<String, dynamic>>.from(response.data['common']
          .map((food) => {
                'item_name': food['food_name'],
                'brand_name': food['brand_name'] ?? 'N/A',
                'nf_calories': food['full_nutrients']
                        ?.firstWhere(
                          (nutrient) => nutrient['attr_id'] == 208,
                          orElse: () => {'value': 'N/A'},
                        )['value'] ??
                    'N/A',
              }));

      emit(FoodSearchLoaded(foods));
    } catch (e) {
      log(e.toString());
      emit(FoodSearchError('Failed to load food data. Error: $e'));
    }
  }
}
