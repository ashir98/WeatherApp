import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_project/model/weather/weather_data_daily.dart';
import 'package:weather_project/utils/colors.dart';

class DailyWeatherWidget extends StatelessWidget {

  WeatherDataDaily weatherDataDaily;
  
  DailyWeatherWidget({super.key, required this.weatherDataDaily});


  String getDay(final day){
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: CustomColors.cardColor,
      child: Padding(
        padding: const EdgeInsets.all(16).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Next Days"),
            15.verticalSpace,
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: weatherDataDaily.daily.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text(getDay(weatherDataDaily.daily[index].dt))),
                    Expanded(child: Image.asset('assets/weather/${weatherDataDaily.daily[index].weather![0].icon}.png', height: 25.h, width: 25.w,)),
                    Expanded(child: Text("${weatherDataDaily.daily[index].temp!.max!.toInt() -273 }° / ${weatherDataDaily.daily[index].temp!.min!.toInt() -273}°", textAlign: TextAlign.end,))
                    // Expanded(child: child),
                  ],
                );
              },
            
            
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
          ],
        ),
      ),
    );
  }
}