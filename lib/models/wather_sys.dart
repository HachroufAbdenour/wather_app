class SysData {
  late final String? country;
  late final DateTime sunrise;
  late final DateTime sunset;

  SysData({
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory SysData.fromJson(Map<String, dynamic> json) {
    return SysData(
      country: json['country'],
      sunrise: json['sunrise'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['sunrise'] * 1000, isUtc: true)
          : DateTime.now(), // Default value if sunrise is null
      sunset: json['sunset'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['sunset'] * 1000, isUtc: true)
          : DateTime.now(), // Default value if sunset is null
    );
  }
}
