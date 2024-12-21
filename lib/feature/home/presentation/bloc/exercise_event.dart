part of 'exercise_bloc.dart';

@immutable
abstract class ExerciseEvent {}

class GetExercisesEvent extends ExerciseEvent {
  final int page;
  final int limit;
  GetExercisesEvent({required this.page, required this.limit});
}

class SearchExercisesEvent extends ExerciseEvent {
  final String query;
  SearchExercisesEvent({required this.query});
}
