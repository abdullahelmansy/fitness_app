import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:new_project/core/utils/colors.dart';
import 'package:new_project/core/utils/text_style.dart';
import 'package:new_project/feature/home/model/response/exercise_reponse_model.dart';

class ExerciseDetails extends StatelessWidget {
  const ExerciseDetails({
    super.key,
    required this.exercises,
  });
  final Exercises exercises;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          exercises.name ?? '',
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
                child: Image.network('${exercises.gifUrl}'),
              ),
              Center(
                child: Text(
                  textAlign: TextAlign.center,
                  (exercises.name ?? '').toUpperCase(),
                  style: getTitleTextStyle(context),
                ),
              ),
              const Gap(10),
              Text(
                'Target Body',
                style: getTitleTextStyle(context),
              ),
              ...exercises.bodyParts?.map((part) => Text(
                        part,
                        style: getBodyTextStyle(context),
                      )) ??
                  [],
              const Gap(10),
              Text(
                'Equipments',
                style: getTitleTextStyle(context),
              ),
              ...exercises.equipments?.map((equipments) => Text(
                        equipments,
                        style: getBodyTextStyle(context),
                      )) ??
                  [],
              const Gap(10),
              Text(
                'Instructions',
                style: getTitleTextStyle(context),
              ),
              ...exercises.instructions?.map((instruction) => Text(
                        instruction,
                        style: getSmallTextStyle(context),
                      )) ??
                  [],
              const Gap(10),
              Text(
                'Target Muscles',
                style: getTitleTextStyle(context),
              ),
              ...exercises.targetMuscles?.map((muscle) => Text(
                        muscle,
                        style: getBodyTextStyle(context),
                      )) ??
                  [],
            ],
          ),
        ),
      ),
    );
  }
}
