import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/feature/food/presentation/bloc/food_search_bloc.dart';
import 'package:new_project/feature/food/presentation/bloc/food_search_event.dart';
import 'package:new_project/feature/food/presentation/bloc/food_search_state.dart';

class FoodSearchView extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  FoodSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Food')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Search Food',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    context
                        .read<FoodSearchBloc>()
                        .add(SearchFoodEvent(_controller.text));
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<FoodSearchBloc, FoodSearchState>(
              builder: (context, state) {
                if (state is FoodSearchLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is FoodSearchLoaded) {
                  return ListView.builder(
                    itemCount: state.foods.length,
                    itemBuilder: (context, index) {
                      final food = state.foods[index];
                      return ListTile(
                        title: Text(food['item_name']),
                        subtitle: Text(
                          'Calories: ${food['nf_calories']} kcal | Fat: ${food['nf_total_fat']}g',
                        ),
                      );
                    },
                  );
                } else if (state is FoodSearchError) {
                  return Center(child: Text(state.message));
                }
                return const Center(child: Text('Start searching for food!'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
