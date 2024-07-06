import 'package:weather_project/model/weather/weather_data_current.dart';
import 'package:weather_project/model/weather/weather_data_daily.dart';
import 'package:weather_project/model/weather/weather_data_hourly.dart';

class WeatherData{
  final WeatherDataCurrent? weatherDataCurrent;
  final WeatherDataHourly? weatherDataHourly;
  final WeatherDataDaily? weatherDataDaily;
  



  WeatherData([this.weatherDataCurrent, this.weatherDataHourly, this.weatherDataDaily]);
}