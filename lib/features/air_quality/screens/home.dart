import 'package:flutter/material.dart';
import 'package:indoor_air_quality/utils/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: TColors.primary,
            )
          ],
        ),
      ),
    );
  }
}
