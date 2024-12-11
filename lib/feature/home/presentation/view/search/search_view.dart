import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/feature/home/presentation/bloc/exercise_bloc.dart';

class ExerciseSearchPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Exercises'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search TextField
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Search Exercise'),
              onChanged: (query) {
                // Trigger the search event whenever the user types something
                if (query.isNotEmpty) {
                  context.read<ExerciseBloc>().add(SearchExercisesEvent(query));
                } else {
                  // Optionally, reset the search to show all exercises
                  context
                      .read<ExerciseBloc>()
                      .add(GetExercisesEvent(page: 1, limit: 50));
                }
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<ExerciseBloc, ExerciseState>(
                builder: (context, state) {
                  if (state is ExerciseLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ExerciseLoaded) {
                    // Ensure you handle exercises loaded correctly
                    if (state.exerciseResponseModel.data?.exercises?.isEmpty ??
                        true) {
                      return const Center(child: Text('No exercises found.'));
                    }

                    return ListView.builder(
                      itemCount:
                          state.exerciseResponseModel.data!.exercises!.length,
                      itemBuilder: (context, index) {
                        final exercise =
                            state.exerciseResponseModel.data!.exercises![index];
                        return ListTile(
                          title: Text(exercise.name ?? 'Unnamed Exercise'),
                          subtitle: Text(exercise.bodyParts?.join(', ') ??
                              'No body parts available'),
                          leading: exercise.gifUrl != null &&
                                  exercise.gifUrl!.isNotEmpty
                              ? Image.network(exercise.gifUrl!)
                              : const Icon(Icons.image),
                        );
                      },
                    );
                  } else if (state is ExerciseError) {
                    return Center(child: Text(state.message));
                  }
                  return const Center(child: Text('No results'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
