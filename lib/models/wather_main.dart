//2

class MainWather {
  late final double temperature;
  late final double feelsLike;
  late final double tempMin;
  late final double tempMax;
  late final int pressure;
  late final int humidity;
  late final int seaLevel;
  late final int groundLevel;

  MainWather({
    required this.temperature,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.groundLevel,
  });
factory MainWather.fromJson(Map<String, dynamic> json) {
  print(json);
  final main = json['main']; // Access the 'main' object
  return MainWather(
    temperature: (main['temp'] ?? 0.0).toDouble(),
    feelsLike: (main['feels_like'] ?? 0.0).toDouble(),
    tempMin: (main['temp_min'] ?? 0.0).toDouble(),
    tempMax: (main['temp_max'] ?? 0.0).toDouble(),
    pressure: main['pressure'] ?? 0,
    humidity: main['humidity'] ?? 0,
    seaLevel: main['sea_level'] ?? 0,
    groundLevel: main['grnd_level'] ?? 0,
  );
}


}

