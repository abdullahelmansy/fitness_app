import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_project/feature/home/model/repo/exercise_repo.dart';
import 'package:new_project/feature/home/model/response/exercise_reponse_model.dart';

part 'exercise_event.dart';
part 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  ExerciseBloc() : super(ExerciseInitial()) {
    on<GetExercisesEvent>(getExercises);
    on<SearchExercisesEvent>(searchExercises);
  }
  
  late ExerciseResponseModel exerciseResponseModel;

  Future<void> getExercises(GetExercisesEvent event, Emitter emit) async {
    emit(ExerciseLoading());
    await ExerciseRepo.getExercises(page: event.page, limit: event.limit).then((value) {
      if (value != null) {
        exerciseResponseModel = value;
        emit(ExerciseLoaded(exerciseResponseModel));
      } else {
        emit(ExerciseError('Failed to fetch data'));
      }
    });
  }

  // Search exercises based on the search query
  Future<void> searchExercises(SearchExercisesEvent event, Emitter emit) async {
    emit(ExerciseLoading());
    await ExerciseRepo.searchExercises(query: event.query).then((value) {
      if (value != null) {
        exerciseResponseModel = value;
        emit(ExerciseLoaded(exerciseResponseModel));
      } else {
        emit(ExerciseError('No exercises found'));
      }
    });
  }
}
