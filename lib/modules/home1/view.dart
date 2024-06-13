
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../home/controller.dart';
import '../home2/view.dart';
import '../home2/widgets/icon_button_widget.dart';
import 'widgets/city_item_widget.dart';
import 'widgets/custom_header.dart';
import 'widgets/wather_info_widget.dart';
import 'widgets/wather_item_widget.dart';

class HomeScreen extends StatelessWidget {
  final HomeController weatherController = Get.put(HomeController(), permanent: true);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5842A9),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2), // Change
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               _buildCustomAppBar(context),
                
                SizedBox(height: 12),
          
              _buildWeatherForecast(),
                
                SizedBox(height: 10),
          
             _buildWeatherContainer(),
          
                SizedBox(height: 18),

              _buildCustomHeader("Today","7-Day Forecasts",() {
                Get.to(()=>HomeScreen2());
              }),
            
            _buildWeatherItemsListView(),
                            SizedBox(height: 10),
           _buildCustomHeader("Other Cities","+", (){}),

                            SizedBox(height: 10),
          _buildWeatherCitiesListView(),

            
          
              ],
            ),
          ),
        ),
      ),
    );
  }




Widget _buildCustomAppBar(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButtonWidget(
        iconPath: "assets/icons/menu_bar.png",
        onPressed: () {

          // Add functionality for menu bar button
        },
        bColor: Color(0xFF331C71),
      ),
      Text(
        
                            "${weatherController.wather.value.cityName}",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      IconButtonWidget(
        iconPath: "assets/icons/restart.png",
        onPressed: () {
          // Add functionality for vertical dots button
          _onRefreshPressed(context);
        },
        bColor: Color(0xFF331C71),
      ),
    ],
  );
}





Widget _buildCustomHeader(String a,String b,VoidCallback? onTap) {
  return  CustomRow(
  leftText: a,
  rightText: b,
  onTap: onTap,
);


}



Widget _buildWeatherItemsListView() {
  return Padding(
    padding: const EdgeInsets.only(top: 5,),
    child: Container(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: List.generate(7, (index) =>  WeatherItemWidget())
      ),
    ),
  );
}

 


 
Widget _buildWeatherCitiesListView() {
  return Padding(
    padding: const EdgeInsets.only(top: 5,),  
    child: Container(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
           children: List.generate(5, (index) => WeatherCityWidget()),
      ),
    ),
  );
}



Widget _buildWeatherForecast() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [


          Text("${weatherController.wather.value.weatherDescription?.description}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          Stack(children: [
            Padding(
              padding: EdgeInsets.only(top: 65, left: 50),
              child: Image.asset(
                "assets/weather/${weatherController.wather.value.weatherDescription?.icon}.png",
              
              ),
            ),
            SizedBox(width: 50),
          
    RichText(  
                text: TextSpan(
                  children: [
                     TextSpan(  text: "${weatherController.wather.value.mainWather!.temperature!.toInt()}°",  style: TextStyle(
                      color: Colors.white,
                      fontSize: 120,
                      fontWeight: FontWeight.bold)),
                     
    
                     ],
                ),
              ),
  

          ]),
         Text(  
              DateFormat('EEEE, d MMMM | hh:mm a').format(DateTime.now()),
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
    );
  }






Widget _buildWeatherContainer() {
    return Container(
      height: 110,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFF331C71),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WeatherInfoWidget(
            iconPath: "assets/icons/weather.png",
            temperature:
                            "${weatherController.wather.value.cloudiness?.percentage}",

            infoTitle: "Precipitation",
          ),
          WeatherInfoWidget(
            iconPath: "assets/icons/humidity.png",
            temperature:
                "${weatherController.wather.value.mainWather?.humidity} %",
            infoTitle: "Humidity",
          ),
          WeatherInfoWidget(
            iconPath: "assets/icons/wind.png",
            temperature:
                            "${weatherController.wather.value.wind?.speed}m/s",

            infoTitle: "Wind Speed",
          ),
        ],
      ),
    );
  }





  void _onRefreshPressed(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.blueGrey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Row(
          children: [
            SizedBox(width: 8),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
            SizedBox(width: 16),
            Text(
              'Refreshing data...',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
    weatherController.refreshData();
  }

int? _convertToEpochMilliseconds(DateTime? dateTime) {
  if (dateTime != null) {
    return dateTime.millisecondsSinceEpoch;
  }
  return null;
}



}

