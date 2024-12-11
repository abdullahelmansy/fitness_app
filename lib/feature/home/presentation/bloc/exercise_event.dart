part of 'exercise_bloc.dart';

@immutable
sealed class ExerciseEvent {}
class GetExercisesEvent extends ExerciseEvent {
  final int page;
  final int limit;

  GetExercisesEvent({ required this.page, required this.limit});

}
class SearchExercisesEvent extends ExerciseEvent {
  final String query;

  SearchExercisesEvent(this.query);
}