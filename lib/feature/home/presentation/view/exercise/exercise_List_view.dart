import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:new_project/feature/home/model/response/exercise_model/exercise_model.dart';

class ExerciseList extends StatelessWidget {
  final List<ExerciseModel> exercises;

  const ExerciseList({super.key, required this.exercises});

  @override
  Widget build(BuildContext context) {
    // Group exercises by body part
    final groupedExercises = groupBy(
      exercises,
      (ExerciseModel exercise) => exercise.bodyPart ?? 'Unknown',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercises by Body Part'),
      ),
      body: ListView(
        children: groupedExercises.entries.map((entry) {
          String bodyPart = entry.key;
          List<ExerciseModel> exercisesForBodyPart = entry.value;

          return ExpansionTile(
            title: Text(
              bodyPart.toUpperCase(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: exercisesForBodyPart.map((exercise) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                child: Card(
                  elevation: 2,
                  child: ListTile(
                    leading: exercise.gifUrl?.isNotEmpty == true
                        ? Image.network(
                            exercise.gifUrl!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )
                        : const Icon(Icons.fitness_center, size: 50),
                    title: Text(
                      exercise.name?.toUpperCase() ?? 'Unknown Exercise',
                      style: const TextStyle(fontSize: 16),
                    ),
                    subtitle: Text(
                      'Target: ${exercise.target ?? "Unknown"}',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        }).toList(),
      ),
    );
  }
}
