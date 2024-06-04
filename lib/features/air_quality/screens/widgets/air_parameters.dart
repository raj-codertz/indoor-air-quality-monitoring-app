import 'package:flutter/material.dart';

class SensorCard extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final String iconPath;

  const SensorCard({
    super.key,
    required this.label,
    required this.value,
    required this.unit,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPath, width: 40, height: 40),
            const SizedBox(height: 10),
            Text(label, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 5),
            Text(
              '$value$unit',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
