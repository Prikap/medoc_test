import 'package:flutter/material.dart';
import '../widgets/meal_card.dart';

class DietPage extends StatelessWidget {
  const DietPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return _buildWideLayout(context);
          }
          return _buildNormalLayout(context);
        },
      ),
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(16.0),
      crossAxisCount: 2,
      childAspectRatio: 1.5,
      children: _buildMealCards(),
    );
  }

  Widget _buildNormalLayout(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: _buildMealCards(),
    );
  }

  List<Widget> _buildMealCards() {
    return [
      const MealCard(
        mealType: 'Breakfast',
        recommendedCalories: 447,
        foods: ['Coffee with milk', 'Sandwich', 'Tomato'],
      ),
      const MealCard(
        mealType: 'Morning Snack',
        recommendedCalories: 547,
        foods: ['Cucumber', 'Tea without sugar'],
      ),
      const MealCard(
        mealType: 'Lunch',
        recommendedCalories: 547,
        foods: ['Boiled egg', 'Avocado', 'Cheese'],
      ),
      const MealCard(
        mealType: 'Evening Snack',
        recommendedCalories: 547,
        foods: [],
      ),
      const MealCard(
        mealType: 'Dinner',
        recommendedCalories: 547,
        foods: [],
      ),
    ];
  }
}