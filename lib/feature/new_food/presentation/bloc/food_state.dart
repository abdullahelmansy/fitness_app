import 'package:equatable/equatable.dart';
import 'package:new_project/feature/new_food/data/model/food_item.dart';

abstract class FoodState extends Equatable {
  const FoodState();
}

class FoodLoading extends FoodState {
  @override
  List<Object> get props => [];
}

class FoodLoaded extends FoodState {
  final List<FoodItem> foods;

  const FoodLoaded(this.foods);

  @override
  List<Object> get props => [foods];
}

class FoodError extends FoodState {
  final String message;

  const FoodError(this.message);

  @override
  List<Object> get props => [message];
}
