import '../models/wather_description.dart';
import '../models/wather_main.dart';
import '../models/wather_wind.dart';
import '../models/wather_sys.dart';
import '../models/wather_clouds.dart';

class Wather {
  final String? cityName;
  final WeatherDescription? weatherDescription;
  final MainWather? mainWather;
  final Wind? wind;
  final Cloudiness? cloudiness;
 final SysData? sysData; 
  final int timezone;


  Wather({
    required this. cityName,       
    required this.weatherDescription,
   required this.mainWather,
    required this.wind,
    required this.cloudiness,
required this.sysData, 
 required this.timezone,
  });

  factory Wather.fromJson(Map<String, dynamic> json) {
    return Wather(
      cityName: json['name'],
      weatherDescription: WeatherDescription.fromJson(json),
   mainWather: MainWather.fromJson(json),
      wind: Wind.fromJson(json),
      cloudiness: Cloudiness.fromJson(json),
     sysData: SysData.fromJson(json),
       timezone: json['timezone'], 
    );
  }
}




