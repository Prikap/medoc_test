import 'package:flutter/material.dart';
import '../widgets/exercise_card.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({Key? key}) : super(key: key);

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
      children: _buildExerciseCards(),
    );
  }

  Widget _buildNormalLayout(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: _buildExerciseCards(),
    );
  }

  List<Widget> _buildExerciseCards() {
    return const [
      ExerciseCard(
        activity: 'Skipping',
        duration: 34,
        calories: 112,
      ),
      ExerciseCard(
        activity: 'Cycling',
        duration: 30,
        calories: 330,
      ),
      ExerciseCard(
        activity: 'Meditation',
        duration: 20,
        calories: 30,
      ),
      ExerciseCard(
        activity: 'Running',
        duration: 30,
        calories: 330,
      ),
    ];
  }
}

