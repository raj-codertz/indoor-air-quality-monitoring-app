import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../../../features/air_quality/models/sensor_data.dart';

class SensorRepository {
  static const String baseUrl =
      'https://api.thingspeak.com/channels/2528798/feeds.json';

  final StreamController<SensorData?> _sensorDataStream =
      StreamController<SensorData?>.broadcast();

  SensorRepository() {
    // Start fetching data every second
    Timer.periodic(const Duration(seconds: 1), (_) => fetchSensorData());
  }

  Stream<SensorData?> get sensorDataStream => _sensorDataStream.stream;

  Future<SensorData?> fetchSensorData() async {
    final apiKey = dotenv.env['THINGSPEAK_API_KEY'];
    final url = '$baseUrl?api_key=$apiKey&results=2';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data['feeds'] != null && data['feeds'].isNotEmpty) {
          final latestData = data['feeds'][0];
          return SensorData(
            dust: double.parse(latestData['field1'] ?? '0.0'),
            smoke: double.parse(latestData['field2'] ?? '0.0'),
            temperature: double.parse(latestData['field3'] ?? '0.0'),
            humidity: double.parse(latestData['field4'] ?? '0.0'),
          );
        }
      } else {
        if (kDebugMode) {
          print('Failed to fetch data: ${response.statusCode}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
    }
    return null;
  }
}
