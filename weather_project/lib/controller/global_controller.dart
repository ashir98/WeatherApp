import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_project/api/fetch_weather.dart';
import 'package:weather_project/model/weather/weather_data.dart';

class GlobalController extends GetxController {
  // create various variables
  final RxBool _isLoading = true.obs;
  final RxDouble _longtitude = 0.0.obs;
  final RxDouble _latitude = 0.0.obs;
  final weatherData = WeatherData().obs;

  //instance for them to be called
  RxBool get checkLoading => _isLoading;
  RxDouble get getLongtitude => _longtitude;
  RxDouble get getLatitude => _latitude;
  WeatherData getWeatherData()=>weatherData.value;


  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    }
    super.onInit();
  }

  getLocation() async {
    LocationPermission locationPermission;
    bool isServiceEnabled;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    // return if service is not enabled
    if (!isServiceEnabled) {
      return Future.error("Location not enabled");
    }

    // status of permission
    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location permission denied forever");
    } else if (locationPermission == LocationPermission.denied) {
      //request permission
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    // get the current position
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      // update our latitude and logtitude
      _latitude.value = value.latitude;
      _longtitude.value = value.longitude;
      

      // calling our api 
      return FetchWeatherApiService().fetchWeather(value.latitude, value.longitude)
      .then((value){
        weatherData.value = value;
        _isLoading.value= false;

      });
    });
  }
}
