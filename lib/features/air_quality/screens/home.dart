import 'package:flutter/material.dart';
import 'package:indoor_air_quality/features/air_quality/screens/widgets/air_parameters.dart';
import 'package:indoor_air_quality/features/air_quality/screens/widgets/home_appbar.dart';
import 'package:indoor_air_quality/utils/constants/sizes.dart';
import '../../../common/widgets/custom_shapes/containers/primary_header_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
                child: Column(
              children: [THomeAppBar(), SizedBox(height: TSizes.lg * 6)],
            )),
            // SizedBox(height: TSizes.spaceBtwSections),

            //   Gridview for four air parameters
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  GridView.builder(
                      itemCount: 4,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: TSizes.gridViewSpacing,
                              crossAxisSpacing: TSizes.gridViewSpacing,
                              mainAxisExtent: 200),
                      itemBuilder: (_, index) => const TAirParameters(
                          title: 'Temperature', value: '40', unit: 'C'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
