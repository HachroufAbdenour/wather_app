import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../modules/home/controller.dart';
import '../../modules/home/widgets/header_widget.dart';

class HomeScreen extends StatelessWidget {
  final HomeController watherController = Get.put(HomeController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () {
            return  SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                   HeaderWidget(
                  cityName: watherController.wather.value.cityName,
                  formattedDateTime: watherController.getFormattedDateTime(),
                                ),
                Divider(height: 20, thickness: 2)
                ,
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: watherController.checkLoading().value
                      ? Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)))
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Your wather details UI here
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
                              'tempMax  : ${watherController.wather.value.mainWather?.tempMax.toStringAsFixed(1)}°C',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'tempMin  : ${watherController.wather.value.mainWather?.tempMin.toStringAsFixed(1)}°C',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                ),
              ],
            ),
          );
  },
      ),
    ),
    );
  
  }
}
