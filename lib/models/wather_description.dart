
//1
class WeatherDescription {
  final String? description;
  final String? main;
  final String? icon;

  WeatherDescription({
    required this.main,
    required this.icon ,
    required this.description,
  });

  factory WeatherDescription.fromJson(Map<String, dynamic> json) {
    return WeatherDescription(
      description: json['weather'][0]['description'],
       main: json['weather'][0]['main'],
       icon: json['weather'][0]['icon'],
    );
  }
}
