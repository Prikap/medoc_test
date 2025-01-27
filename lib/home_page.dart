import 'package:flutter/material.dart';
import '../widgets/progress_card.dart';
import '../widgets/time_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                const TimeHeader(title: 'Vitals'),
                const SizedBox(height: 20),
                ProgressCard(
                  current: 569,
                  goal: 2000,
                  label: 'Calories',
                  color: Colors.orange,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                const SizedBox(height: 48), // Offset for header
                ProgressCard(
                  current: 2048,
                  goal: 6000,
                  label: 'Steps',
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNormalLayout(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const TimeHeader(title: 'Vitals'),
          const SizedBox(height: 20),
          ProgressCard(
            current: 569,
            goal: 2000,
            label: 'Calories',
            color: Colors.orange,
          ),
          const SizedBox(height: 16),
          ProgressCard(
            current: 2048,
            goal: 6000,
            label: 'Steps',
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}