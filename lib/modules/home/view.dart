import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../modules/home/controller.dart';

class HomeScreen extends StatelessWidget {
  final HomeController watherController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Center(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'City: ${watherController.wather.value.cityName}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Description: ${watherController.wather.value.weatherDescription?.description}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Temperature: ${watherController.wather.value.mainWather?.temperature.toStringAsFixed(1)}°C',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Feels Like: ${watherController.wather.value.mainWather?.feelsLike.toStringAsFixed(1)}°C',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Humidity: ${watherController.wather.value.mainWather?.humidity}%',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Wind Speed: ${watherController.wather.value.wind?.speed.toStringAsFixed(1)} m/s',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Cloudiness: ${watherController.wather.value.cloudiness?.percentage}%',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Sunrise Time: ${watherController.wather.value.sysData?.sunrise}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Sunset Time: ${watherController.wather.value.sysData?.sunset}',
                style: TextStyle(fontSize: 18),
              ),
                 SizedBox(height: 10),
              Text(
                'TimeZone: ${watherController.wather.value.timezone}',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
