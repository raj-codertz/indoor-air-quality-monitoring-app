import 'package:flutter/material.dart';
import 'package:indoor_air_quality/common/styles/shadows.dart';
import 'package:indoor_air_quality/utils/constants/colors.dart';
import 'package:indoor_air_quality/utils/constants/sizes.dart';
import 'package:indoor_air_quality/utils/helpers/helper_functions.dart';

class TAirParameters extends StatelessWidget {
  const TAirParameters(
      {super.key,
      required this.title,
      required this.value,
      required this.unit});

  final String title, value, unit;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Container(
      width: 200,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          boxShadow: [TShadowStyle.airParametersShadow],
          borderRadius: BorderRadius.circular(16),
          color: dark ? TColors.darkerGrey : TColors.white),
      child: Column(
        children: [
          //   Air Parameter
          Text(title, style: Theme.of(context).textTheme.headlineMedium!.apply(fontSizeFactor: 1.2)),
          const SizedBox(height: TSizes.spaceBtwSections * 2),
          //   Value
          Row(
            children: [
              Text(value, style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(width: TSizes.spaceBtwItems),
              Text(unit, style: Theme.of(context).textTheme.labelLarge)
            ],
          )
        ],
      ),
    );
  }
}
