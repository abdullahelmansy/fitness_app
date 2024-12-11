import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:new_project/core/utils/text_style.dart';
import 'package:new_project/feature/bmi/presentation/bloc/bmi_bloc.dart';
import 'package:new_project/feature/bmi/presentation/bloc/bmi_event.dart';
import 'package:new_project/feature/bmi/presentation/bloc/bmi_state.dart';

class BMIScreen extends StatelessWidget {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  BMIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI Calculator')),
      body: BlocProvider(
        create: (_) => BMIBloc(),
        child: BlocBuilder<BMIBloc, BMIState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: heightController,
                      decoration:
                          const InputDecoration(labelText: 'Height (cm)'),
                      keyboardType: TextInputType.number,
                    ),
                    const Gap(10),
                    TextField(
                      controller: weightController,
                      decoration:
                          const InputDecoration(labelText: 'Weight (kg)'),
                      keyboardType: TextInputType.number,
                    ),
                    const Gap(10),
                    ElevatedButton(
                      onPressed: () {
                        final height = double.parse(heightController.text);
                        final weight = double.parse(weightController.text);
                        context
                            .read<BMIBloc>()
                            .add(CalculateBMI(height: height, weight: weight));
                      },
                      child: const Text('Calculate BMI'),
                    ),
                    if (state is BMICalculated)
                      Center(
                          child: Column(
                        children: [
                          const Gap(10),
                          Text(
                            'Your BMI is ${state.bmi.toStringAsFixed(2)}',
                            style: getBodyTextStyle(context),
                          ),
                          const Gap(10),
                          Text(
                              state.bmi < 18.5
                                  ? 'Underweight'
                                  : state.bmi < 24.9
                                      ? 'Normal Continue doing exercise'
                                      : state.bmi < 29.9
                                          ? 'Overweight should do exercise'
                                          : 'Obesity must do exercise',
                              style: getBodyTextStyle(context)),
                        ],
                      )),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
