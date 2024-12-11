import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/core/functions/navigation.dart';
import 'package:new_project/core/utils/text_style.dart';
import 'package:new_project/feature/home/presentation/bloc/exercise_bloc.dart';
import 'package:new_project/feature/home/presentation/view/exercise/exercise_List_view.dart';
import 'package:new_project/feature/home/presentation/view/exercise/exercise_details.dart';
import 'package:new_project/feature/home/presentation/widget/exercise_cart_widget.dart';

class ExerciseView extends StatelessWidget {
  const ExerciseView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            ExerciseBloc()..add(GetExercisesEvent(page: 1, limit: 50)),
        child: BlocBuilder<ExerciseBloc, ExerciseState>(
          buildWhen: (previous, current) =>
              current is ExerciseLoaded || current is ExerciseLoading,
          builder: (context, state) {
            if (state is ExerciseLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ExerciseLoaded) {
              var exercise = context
                  .read<ExerciseBloc>()
                  .exerciseResponseModel
                  .data!
                  .exercises;

              return Scaffold(
                  appBar: AppBar(
                    title: Text(
                      'Exercise',
                      style: getTitleTextStyle(
                        context,
                        color: Colors.white,
                      ),
                    ),
                    actions: [
                      IconButton(
                          onPressed: () {
                            push(context,
                                ExerciseList(exercises: exercise!.toList()));
                          },
                          icon: const Icon(Icons.search_sharp))
                    ],
                  ),
                  body: Column(
                    children: [
                      Expanded(
                        child: Center(
                            child: ListView.builder(
                                itemCount: exercise?.length,
                                itemBuilder: (context, index) {
                                  return ExerciseCartWidget(
                                    onTap: () => push(
                                      context,
                                      ExerciseDetails(
                                        exercises: exercise[index],
                                      ),
                                    ),
                                    name: exercise![index].name ?? '',
                                    imageUrl: exercise[index].gifUrl ?? "",
                                    bodyParts: exercise[index].bodyParts![0],
                                  );
                                })),
                      ),
                    ],
                  ));
            } else {
              return Container();
            }
          },
        ));
  }
}
