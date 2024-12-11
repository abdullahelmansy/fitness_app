part of 'exercise_bloc.dart';

@immutable
sealed class ExerciseState {}

final class ExerciseInitial extends ExerciseState {}

class ExerciseLoading extends ExerciseState {}

class ExerciseLoaded extends ExerciseState {
  final ExerciseResponseModel exerciseResponseModel;

  ExerciseLoaded(this.exerciseResponseModel);
}

final class ExerciseError extends ExerciseState {
  final String message;
  ExerciseError(this.message);
}
