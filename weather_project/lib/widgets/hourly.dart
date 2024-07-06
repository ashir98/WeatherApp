import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_project/model/weather/weather_data_hourly.dart';
import 'package:weather_project/utils/colors.dart';

class HourlWeatherWidget extends StatelessWidget {
  WeatherDataHourly weatherDataHourly;
  HourlWeatherWidget({super.key, required this.weatherDataHourly});

  getTime(final timeStamp){
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String x = DateFormat('jm').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Text("Today"),
        5.verticalSpace,
        SizedBox(
          height: 90.h,
          child: ListView.builder(
            
            scrollDirection: Axis.horizontal,
            itemCount: weatherDataHourly.hourly.length>12? 12 : weatherDataHourly.hourly.length,
            itemBuilder: (context, index) {
            
                return SizedBox(
                  height: 90.h,
                  width: 80.w,
                  child: Card(
                    elevation: 0,
                    color: index==0? CustomColors.firstGradientColor : CustomColors.cardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(getTime(weatherDataHourly.hourly[index].dt) , style: TextStyle(color: index==0?Colors.white: Colors.black   ),),
                        Image.asset('assets/weather/${weatherDataHourly.hourly[index].weather![0].icon}.png',   height: 40.h, width: 40.w,),
                        Text("${weatherDataHourly.hourly[index].temp!.toInt() -273}°",style: TextStyle(color: index==0?Colors.white: Colors.black),)
                      ],
                    ),
                  )
                );
              
            },
          ),
        )

      ],
    );
  }
}