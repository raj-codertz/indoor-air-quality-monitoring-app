import 'dart:async';

import 'package:get/get.dart';
import 'package:indoor_air_quality/utils/constants/image_strings.dart';
import '../../../../data/repositories/sensor/sensor_repository.dart';
import '../../models/sensor_data.dart';

class SensorController extends GetxController {
  var isLoading = true.obs;
  var sensorData = SensorData(
    temperature: 0.0,
    humidity: 0.0,
    smoke: 0.0,
    dust: 0.0,
  ).obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
    Timer.periodic(const Duration(seconds: 1), (_) => fetchData());
  }

  void fetchData() async {
    try {
      isLoading(true);
      var data = await SensorRepository().fetchSensorData();
      if (data != null) {
        sensorData.value = data;
      }
    } finally {
      isLoading(false);
    }
  }

  List get myDevices => [
        [
          'Temperature',
          TImages.temperature,
          sensorData.value.temperature.toStringAsFixed(1),
          '°C'
        ],
        [
          'Humidity',
          TImages.humidity,
          sensorData.value.humidity.toString(),
          '%'
        ],
        [
          'Smoke',
          TImages.smoke,
          sensorData.value.smoke.toStringAsFixed(1),
          '%'
        ],
        ['Dust', TImages.dust, sensorData.value.dust.toString(), '%'],
      ];
}
