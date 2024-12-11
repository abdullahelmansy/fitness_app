import 'package:equatable/equatable.dart';

abstract class FoodSearchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchFoodEvent extends FoodSearchEvent {
  final String query;

  SearchFoodEvent(this.query);

  @override
  List<Object?> get props => [query];
}
