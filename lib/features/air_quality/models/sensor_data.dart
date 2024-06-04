class SensorData {
  final double temperature;
  final double humidity;
  final double smoke;
  final double dust;

  SensorData({
    required this.temperature,
    required this.humidity,
    required this.smoke,
    required this.dust,
  });

  factory SensorData.fromJson(Map<String, dynamic> json) {
    return SensorData(
      temperature: json['temperature'],
      humidity: json['humidity'],
      smoke: json['smoke'],
      dust: json['dust'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'temperature': temperature,
      'humidity': humidity,
      'smoke': smoke,
      'dust': dust,
    };
  }
}