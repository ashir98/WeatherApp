import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weather_project/model/weather/weather_data_current.dart';
import 'package:weather_project/utils/colors.dart';

class ComfortLevel extends StatelessWidget {
  WeatherDataCurrent weatherDataCurrent;
  ComfortLevel({super.key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Comfort Level"),

        10.verticalSpace,


        SleekCircularSlider(

          initialValue: weatherDataCurrent.current.humidity!.toDouble(),
          

          
          appearance: CircularSliderAppearance(

            infoProperties: InfoProperties(
              bottomLabelText: "Humidity",
              bottomLabelStyle: TextStyle(color: Colors.black)
            ),

            animationEnabled: true,

            customWidths: CustomSliderWidths(
              progressBarWidth: 12,
              trackWidth: 12,
              
            ),
            
            customColors: CustomSliderColors(
              trackColor: CustomColors.firstGradientColor.withAlpha(100),
              progressBarColors:[
                CustomColors.firstGradientColor,
                CustomColors.secondGradientColor
              ] 
            )
          ),

        ),


        Text("Feels like: ${weatherDataCurrent.current.feelsLike!.toInt()-273}°C")
        
      ],
    );
  }
}