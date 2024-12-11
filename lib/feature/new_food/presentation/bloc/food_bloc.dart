import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:new_project/feature/new_food/data/model/food_item.dart';
import 'food_event.dart';
import 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final Dio dio;

  FoodBloc(this.dio) : super(FoodLoading()) {
    on<LoadFood>(_onLoadFood);
    on<AddFood>(_onAddFood);
  }

  void _onLoadFood(LoadFood event, Emitter<FoodState> emit) async {
    try {
      final response = await dio.get(
          'https://api.spoonacular.com/food/products?apiKey=6ad093e156f84de5966b3a03f6690146');
      final List<FoodItem> foods = (response.data['products'] as List)
          .map((json) => FoodItem.fromJson(json))
          .toList();
      emit(FoodLoaded(foods));
    } catch (e) {
      emit(FoodError(e.toString()));
    }
  }

  void _onAddFood(AddFood event, Emitter<FoodState> emit) async {
    if (state is FoodLoaded) {
      final List<FoodItem> updatedFoods = List.from((state as FoodLoaded).foods)
        ..add(event.food);
      emit(FoodLoaded(updatedFoods));
    }
  }
}
