import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/feature/food/presentation/bloc/food_search_bloc.dart';
import 'package:new_project/feature/food/presentation/bloc/food_search_event.dart';
import 'package:new_project/feature/food/presentation/bloc/food_search_state.dart';

class NutritionHomePage extends StatefulWidget {
  const NutritionHomePage({super.key});

  @override
  _NutritionHomePageState createState() => _NutritionHomePageState();
}

class _NutritionHomePageState extends State<NutritionHomePage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meal Tracker')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter food item',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context
                    .read<NutritionBloc>()
                    .add(FetchNutritionData(_controller.text));
              },
              child: const Text('Get Nutrition Info'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<NutritionBloc, NutritionState>(
                builder: (context, state) {
                  if (state is NutritionLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is NutritionLoaded) {
                    return ListView.builder(
                      itemCount: state.nutritionData.length,
                      itemBuilder: (context, index) {
                        final food = state.nutritionData[index];
                        return Card(
                          child: ListTile(
                            leading: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  food.photo.thumb ?? '',
                                )),
                            title: Text(food.foodName),
                            subtitle: Text(
                              'Calories: ${food.calories} kcal\n'
                              'Protein: ${food.protein} g\n'
                              'Carbs: ${food.carbs} g\n'
                              'Fat: ${food.fat} g',
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is NutritionError) {
                    return Center(child: Text(state.message));
                  }
                  return const Text(
                      'Enter a food item to see its nutrition info.');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
