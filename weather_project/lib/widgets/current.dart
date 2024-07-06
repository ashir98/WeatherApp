import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_project/model/weather/weather_data_current.dart';
import 'package:weather_project/utils/colors.dart';

class CurrentTemperatureWidget extends StatelessWidget {
  WeatherDataCurrent weatherDataCurrent;
  CurrentTemperatureWidget({super.key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        // temperature area

        SizedBox(
          height: 100.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Align(alignment: Alignment.centerLeft  ,child: Image.asset('assets/weather/${weatherDataCurrent.current.weather![0].icon}.png'))),
              VerticalDivider(color: CustomColors.dividerLine, indent: 20, endIndent: 20,  thickness: 3,  ),
              Expanded(
                child: RichText(
                  
                  textAlign: TextAlign.end,
                  text: TextSpan(
                    children: [
                      TextSpan(text: "${weatherDataCurrent.current.temp!.toInt()-273}°", style: TextStyle(fontSize: 55.sp, color: Colors.black)),
                      TextSpan(text: weatherDataCurrent.current.weather![0].main, style: TextStyle(fontSize: 13.sp, color: Colors.grey)),
                    ]
                  ),
                )
              )
            ],
          ),
        ),


        10.verticalSpace,


        // more details - windspeed, humidity, clouds
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
             children: [
              Container(
                height: 60.h,
                width: 65.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: CustomColors.cardColor
                ),

                child: Center(
                    child: SizedBox(
                      height: 30.h,
                      width: 30.w,
                      child: Image.asset('assets/icons/windspeed.png'),
                    ),
                  ),
              ),
             7.verticalSpace,
              Text("${weatherDataCurrent.current.windSpeed.toString()} km/h", style: TextStyle(fontSize: 12.sp),)
             ], 
            ),

            Column(
             children: [
              Container(
                height: 60.h,
                width: 65.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: CustomColors.cardColor
                ),
                child: Center(
                    child: SizedBox(
                      height: 30.h,
                      width: 30.w,
                      child: Image.asset('assets/icons/clouds.png'),
                    ),
                  ),
              ),
              7.verticalSpace,
              Text("${weatherDataCurrent.current.clouds}%", style: TextStyle(fontSize: 12.sp),)
             ], 
            ),


            Column(
             children: [
              Container(
                height: 60.h,
                width: 65.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: CustomColors.cardColor
                ),

                child: Center(
                    child: SizedBox(
                      height: 30.h,
                      width: 30.w,
                      child: Image.asset('assets/icons/humidity.png'),
                    ),
                  ),
              ),
             7.verticalSpace,
              Text("${weatherDataCurrent.current.humidity.toString()}%", style: TextStyle(fontSize: 12.sp),)
             ], 
            ),



            



            
          ],

        )

      ]
    );
  }
}
