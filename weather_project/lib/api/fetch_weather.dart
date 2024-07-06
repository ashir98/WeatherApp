import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_project/api/api_key.dart';
import 'package:weather_project/model/weather/weather_data.dart';
import 'package:weather_project/model/weather/weather_data_current.dart';
import 'package:weather_project/model/weather/weather_data_daily.dart';
import 'package:weather_project/model/weather/weather_data_hourly.dart';

class FetchWeatherApiService{

  WeatherData? weatherData;


  Future<WeatherData> fetchWeather(lan,lon)async{
    var respose = await http.get(Uri.parse(apiUrl(lon, lan)));
    if (respose.statusCode == 200) {
      Map<String,dynamic> data = jsonDecode(respose.body);
      weatherData = WeatherData(WeatherDataCurrent.fromJson(data),  WeatherDataHourly.fromJson(data), WeatherDataDaily.fromJson(data)   );
      return weatherData!;
    }else{
      return Future.error("Something went wrong");
    }
  }
}




String apiUrl(lon,lan){
  String url;
  url = "https://api.openweathermap.org/data/3.0/onecall?lat=$lan&lon=$lon&appid=$apiKey&unit=metric&exclude=minutely";
  return url;
}