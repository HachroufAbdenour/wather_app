
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/core/values/constants.dart';
import 'package:weatherapp_starter_project/models/wather.dart';
import 'package:intl/intl.dart';
import '../controller.dart';
import 'custom_icon_text_widget.dart';

class CurrentWatherWidget extends StatelessWidget {
   CurrentWatherWidget({super.key});
    final HomeController watherController = Get.put(HomeController(), permanent: true);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
//temrateur Area 
temprateurAreaWidget(),
//wather details
currentWatherDetails(),
//sunrise sunset
sunchyWidget()

      ],
    ); 
  }
  




 Widget temprateurAreaWidget() 
  { 
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          
              Image.asset("assets/weather/${watherController.wather.value.weatherDescription?.icon}.png",
              height: 70,width: 70,),
            
           Container(
            height: 50,
           width: 1,
           color: dividerline,
           ),
            RichText(
              
              text: TextSpan(
                children: [
                   TextSpan(  text: "${watherController.wather.value.mainWather!.temperature!.toInt()}°",style: TextStyle(color: textColorBlack,fontSize: 65,fontWeight: FontWeight.bold)),
                   
                    TextSpan(  text: "${watherController.wather.value.weatherDescription?.description}°",style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w400)) 

                   ],
              ),
            ),
           
            ],
          ),
        );

  }


Widget currentWatherDetails(){

  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       IconWithText(
    iconAssetPath: "assets/icons/windspeed.png",
    text: "${watherController.wather.value.wind?.speed} %",
    hight: 60,
    widht: 60,
    ),
     IconWithText(
    iconAssetPath: "assets/icons/clouds.png",
    
    text: "${watherController.wather.value.cloudiness?.percentage} %",
    hight: 60,
    widht: 60,
    ),
     IconWithText(
    iconAssetPath: "assets/icons/humidity.png",
    text: "${watherController.wather.value.mainWather?.humidity} %",
    
    hight: 60,
    widht: 60,),
      ],
    ),
  );
}
















Widget sunchyWidget(){

  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
      color: Color.fromARGB(255, 161, 223, 254),
        borderRadius:BorderRadius.circular(20),
         ),
    
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           IconWithText(
    iconAssetPath: "assets/icons/sunrisee.png",
 text: watherController.formatTime(_convertToEpochMilliseconds(watherController.wather.value.sysData?.sunrise)),        hight: 80,
        widht: 80,
        ),
         IconWithText(
    iconAssetPath: "assets/icons/sunsett.png",
 text: watherController.formatTime(_convertToEpochMilliseconds(watherController.wather.value.sysData?.sunset)),        hight: 80,
        widht: 80,
        ),
       
          ],
        ),
      ),
    ),
  );
}


int? _convertToEpochMilliseconds(DateTime? dateTime) {
  if (dateTime != null) {
    return dateTime.millisecondsSinceEpoch;
  }
  return null;
}
  }