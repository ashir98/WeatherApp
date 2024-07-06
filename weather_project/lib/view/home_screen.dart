import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:weather_project/controller/global_controller.dart';
import 'package:weather_project/widgets/comfort.dart';
import 'package:weather_project/widgets/daily.dart';
import 'package:weather_project/widgets/header.dart';
import 'package:weather_project/widgets/hourly.dart';
import 'package:weather_project/widgets/current.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () {
            return globalController.checkLoading.isTrue
                ? Center(
                    child: Image.asset('assets/icons/clouds.png'),
                  )
                : Padding(
                  padding: EdgeInsets.all(22).r,
                  child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        // header
                        Header(),

                        15.verticalSpace,
                  
                        CurrentTemperatureWidget(weatherDataCurrent: globalController.getWeatherData().weatherDataCurrent!),


                        20.verticalSpace,

                        // HOURLY DATA
                        HourlWeatherWidget(weatherDataHourly: globalController.getWeatherData().weatherDataHourly!,),

                        20.verticalSpace,



                        // DAILY DATA
                        DailyWeatherWidget(weatherDataDaily: globalController.getWeatherData().weatherDataDaily!,),


                        20.verticalSpace,


                        // COMFORT LEVEL
                        ComfortLevel(weatherDataCurrent: globalController.getWeatherData().weatherDataCurrent!,)


                      ],
                    ),
                );
          },
        ),
      ),
    );
  }
}
