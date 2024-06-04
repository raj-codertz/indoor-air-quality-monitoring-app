import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indoor_air_quality/features/air_quality/screens/widgets/air_parameters.dart';
import 'package:indoor_air_quality/features/air_quality/screens/widgets/home_appbar.dart';
import 'package:indoor_air_quality/utils/constants/sizes.dart';
import '../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../controllers/sensor/sensor_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final SensorController sensorController = Get.put(SensorController());

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
              padding: const EdgeInsets.all(TSizes.defaultSpace / 3),
              child: Column(
                children: [
                  Obx(
                    () => GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 38,
                      ),
                      itemCount: sensorController.myDevices.length,
                      itemBuilder: (context, index) {
                        final device = sensorController.myDevices[index];
                        return SensorCard(
                          label: device[0],
                          value: device[2],
                          unit: device[3],
                          iconPath: device[1],
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
