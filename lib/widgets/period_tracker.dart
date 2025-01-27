import 'package:flutter/material.dart';

class PeriodTracker extends StatelessWidget {
  const PeriodTracker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Period Tracker',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildCycleInfo(),
            const SizedBox(height: 24),
            _buildSymptomsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildCycleInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildInfoItem('Current Day', 'Day 4'),
        _buildInfoItem('Cycle Length', '24 Days'),
        _buildInfoItem('Next Period', '17 Days'),
      ],
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildSymptomsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Symptoms',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8),
        SymptomChip(label: 'Cramps'),
        SymptomChip(label: 'Fatigue'),
        SymptomChip(label: 'Headache'),
      ],
    );
  }
}
class SymptomChip extends StatelessWidget {
  final String label;

  const SymptomChip({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Chip(
        label: Text(label),
        backgroundColor: Colors.blue[100],
      ),
    );
  }
}

// lib/widgets/calendar_widget.dart
class CalendarWidget extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;

  const CalendarWidget({
    Key? key,
    required this.selectedDate,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: CalendarDatePicker(
        initialDate: selectedDate,
        firstDate: DateTime(2020),
        lastDate: DateTime(2030),
        onDateChanged: onDateSelected,
      ),
    );
  }
}

// lib/widgets/mood_selector.dart
class MoodSelector extends StatelessWidget {
  final String selectedMood;
  final Function(String) onMoodSelected;

  const MoodSelector({
    Key? key,
    required this.selectedMood,
    required this.onMoodSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moods = ['Happy', 'Stressed', 'Tired', 'Energetic', 'Relaxed'];

    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: moods.map((mood) => _buildMoodChip(mood, context)).toList(),
    );
  }

  Widget _buildMoodChip(String mood, BuildContext context) {
    final isSelected = mood == selectedMood;

    return FilterChip(
      label: Text(mood),
      selected: isSelected,
      onSelected: (selected) {
        onMoodSelected(mood);
      },
      backgroundColor: isSelected ? Theme.of(context).primaryColor : null,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : null,
      ),
    );
  }
}

// lib/widgets/stats_card.dart
class StatsCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color? color;

  const StatsCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 32,
              color: color ?? Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
