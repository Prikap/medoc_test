import 'package:flutter/material.dart';
import '../widgets/period_tracker.dart';

class WomensHealthPage extends StatelessWidget {
  const WomensHealthPage({Key? key}) : super(key: key);

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
    return Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const PeriodTracker(),
                // Add more widgets specific to women's health
              ],
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Add calendar or other tracking features
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNormalLayout(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: const [
          PeriodTracker(),
          // Add more widgets specific to women's health
        ],
      ),
    );
  }
}