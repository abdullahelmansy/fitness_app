import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:new_project/core/utils/colors.dart';
import 'package:new_project/core/utils/text_style.dart';
import 'package:new_project/feature/home/model/response/exercise_model/exercise_model.dart';

class ExerciseDetails extends StatelessWidget {
  const ExerciseDetails({
    super.key,
    required this.exercise,
  });
  final ExerciseModel exercise;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          exercise.name ?? '',
          style: getTitleTextStyle(
            context,
            color: AppColors.whiteColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network('${exercise.gifUrl}'),
              ),
              Center(
                child: Text(
                  textAlign: TextAlign.center,
                  (exercise.name ?? '').toUpperCase(),
                  style: getTitleTextStyle(context),
                ),
              ),
              const Gap(10),
              Text(
                'Target Body',
                style: getTitleTextStyle(context),
              ),
              Text(
                exercise.bodyPart ?? 'Unknown',
                style: getBodyTextStyle(context),
              ),
              const Gap(10),
              Text(
                'Equipments',
                style: getTitleTextStyle(context),
              ),
              Text(
                exercise.equipment ?? 'Unknown',
                style: getBodyTextStyle(context),
              ),
              const Gap(10),
              Text(
                'Instructions',
                style: getTitleTextStyle(context),
              ),
              ...exercise.instructions?.map((instruction) => Text(
                    instruction,
                    style: getSmallTextStyle(context),
                  )) ?? [],
              const Gap(10),
              Text(
                'Target Muscles',
                style: getTitleTextStyle(context),
              ),
              Text(
                exercise.target ?? 'Unknown',
                style: getBodyTextStyle(context),
              ),
              const Gap(10),
              Text(
                'Secondary Muscles',
                style: getTitleTextStyle(context),
              ),
              ...exercise.secondaryMuscles?.map((muscle) => Text(
                    muscle,
                    style: getBodyTextStyle(context),
                  )) ?? [],
            ],
          ),
        ),
      ),
    );
  }
}
