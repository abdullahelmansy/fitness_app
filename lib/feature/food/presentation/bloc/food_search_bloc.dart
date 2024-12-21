// bloc/nutrition_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/core/constants/api_constant.dart';
import 'package:new_project/feature/food/data/repo/food_repo.dart';
import 'package:new_project/feature/food/presentation/bloc/food_search_event.dart';
import 'package:new_project/feature/food/presentation/bloc/food_search_state.dart';

class NutritionBloc extends Bloc<NutritionEvent, NutritionState> {
  NutritionBloc() : super(NutritionInitial()) {
    on<FetchNutritionData>((event, emit) async {
      emit(NutritionLoading());
      try {
        final data = await NutritionRepository.fetchNutritionData(
          event.query,
          ApiConstant.appId,
          ApiConstant.appApiKey,
        );
        emit(NutritionLoaded(data));
      } catch (e) {
        emit(NutritionError('Failed to fetch data: $e'));
      }
    });
  }
}
