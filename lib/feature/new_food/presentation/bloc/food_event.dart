import 'package:equatable/equatable.dart';
import 'package:new_project/feature/new_food/data/model/food_item.dart';

abstract class FoodEvent extends Equatable {
  const FoodEvent();
}

class LoadFood extends FoodEvent {
  @override
  List<Object> get props => [];
}

class AddFood extends FoodEvent {
  final FoodItem food;

  AddFood(this.food);

  @override
  List<Object> get props => [food];
}
