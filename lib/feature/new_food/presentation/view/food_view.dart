import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/food_bloc.dart';
import '../bloc/food_event.dart';
import '../bloc/food_state.dart';

class FoodView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nutrition App'),
      ),
      body: BlocBuilder<FoodBloc, FoodState>(
        builder: (context, state) {
          if (state is FoodLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FoodLoaded) {
            return ListView.builder(
              itemCount: state.foods.length,
              itemBuilder: (context, index) {
                final food = state.foods[index];
                return ListTile(
                  title: Text(food.name),
                  subtitle: Text('Calories: ${food.calories}'),
                );
              },
            );
          } else if (state is FoodError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<FoodBloc>(context).add(LoadFood());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
