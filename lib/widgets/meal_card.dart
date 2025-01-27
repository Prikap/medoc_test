import 'package:flutter/material.dart';

class MealCard extends StatelessWidget {
  final String mealType;
  final int recommendedCalories;
  final List<String> foods;

  const MealCard({
    Key? key,
    required this.mealType,
    required this.recommendedCalories,
    required this.foods,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  mealType,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Recommended: $recommendedCalories kcal',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (foods.isEmpty)
              const Text('No foods logged yet')
            else
              ...foods.map((food) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: [
                    const Icon(Icons.circle, size: 8),
                    const SizedBox(width: 8),
                    Text(food),
                  ],
                ),
              )),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement add food functionality
              },
              child: const Text('Add Food'),
            ),
          ],
        ),
      ),
    );
  }
}