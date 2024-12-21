part of 'exercise_bloc.dart';

@immutable
abstract class ExerciseState {}

class ExerciseInitial extends ExerciseState {}

class ExerciseLoading extends ExerciseState {}

class ExerciseLoaded extends ExerciseState {
  final List<ExerciseModel> exercises;
  ExerciseLoaded(this.exercises);
}

class ExerciseError extends ExerciseState {
  final String message;
  ExerciseError(this.message);
}
