import 'package:equatable/equatable.dart';

abstract class FoodSearchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FoodSearchInitial extends FoodSearchState {}

class FoodSearchLoading extends FoodSearchState {}

class FoodSearchLoaded extends FoodSearchState {
  final List<Map<String, dynamic>> foods;

  FoodSearchLoaded(this.foods);

  @override
  List<Object?> get props => [foods];
}

class FoodSearchError extends FoodSearchState {
  final String message;

  FoodSearchError(this.message);

  @override
  List<Object?> get props => [message];
}
