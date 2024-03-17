import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/models/wather_clouds.dart';
import 'package:weatherapp_starter_project/models/wather_main.dart';
import 'package:weatherapp_starter_project/models/wather_sys.dart';
import 'package:weatherapp_starter_project/models/wather_wind.dart';
import '../../models/wather.dart';
import '../../models/wather_description.dart';
import '../../services/remote/wather_repository.dart';

class HomeController extends GetxController {

final  RxBool _isLoading=true.obs;
final  RxDouble _lattitude=0.0.obs;
final  RxDouble _longitude=0.0.obs;


RxBool checkLoading()=>_isLoading;
RxDouble checkLatitude()=>_lattitude;
RxDouble checklongitude()=>_longitude;


final WeatherRepository _weatherService = WeatherRepository();


  var wather = Wather(
    timezone: 0,
    mainWather: MainWather(temperature: 0, feelsLike: 0.0, tempMin: 0.0, tempMax:0.0, pressure: 0, humidity: 0, seaLevel: 0, groundLevel: 0),
    cityName: '',
    weatherDescription: WeatherDescription(description: '',main: '',icon: ''),
     wind: Wind(speed: 0.0),
      cloudiness: Cloudiness(percentage: 0),
  sysData: SysData(country: '', sunrise: DateTime.now(), sunset: DateTime.now(),)
  ).obs;


String getFormattedDateTime() {
    int timezoneOffsetSeconds = wather.value.timezone;
    DateTime currentTime = DateTime.now();
    DateTime adjustedTime = currentTime.add(Duration(seconds: timezoneOffsetSeconds));
    String formattedDateTime = DateFormat('EEEE, MMMM d, y - hh:mm a').format(adjustedTime);
    return formattedDateTime;
  }


  Future<void> fetchWeather(double latitude, double longitude) async {
    try {
      var fetchedWeather = await _weatherService.getWeather(latitude, longitude);
      wather.value = fetchedWeather;
    } catch (e) {
      print(e.toString());
    }
  }

Future<void> fetchWeatherForCurrentLocation() async {
    Position? position = await _getCurrentLocation();
    if (position != null) {
        _lattitude.value = position.latitude;
      _longitude.value = position.longitude;

      await fetchWeather(  _lattitude.value, _longitude.value );
    } else {
      // Handle case when location cannot be retrieved
      print('Unable to fetch current location');
    }
  }

  
   Future<Position?> _getCurrentLocation() async {
    try {
      return await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } catch (e) {
      print("Error getting location: $e");
      return null;
    }
   }


Future<bool>  handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;  
    
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar(
        'Error',
        'Location services are disabled. Please enable the services',
      );
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {   
        Get.snackbar(
          'Error',
          'Location permissions are denied',
        );
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar(
        'Error',
        'Location permissions are permanently denied, we cannot request permissions.',
      );
      return false;
    }
    return true;
  }

  @override
  Future<void> onInit() async {
    _isLoading.value =true;
     bool hasPermission = await handleLocationPermission();
          if (hasPermission) {
            fetchWeatherForCurrentLocation();
          }

           _isLoading.value = false;
    
    
        super.onInit();
  }

  
  Future<void> refreshData() async {
    // Implement your logic to refresh the weather data
    // For example, you can call fetchWeatherForCurrentLocation() again
    await fetchWeatherForCurrentLocation();
  }
   

  }








