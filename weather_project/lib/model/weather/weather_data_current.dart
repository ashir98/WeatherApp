import 'dart:convert';

class WeatherDataCurrent{
  final Current current;
  WeatherDataCurrent({required this.current});

  factory WeatherDataCurrent.fromJson(Map<String,dynamic> json){
    return WeatherDataCurrent(
      current: Current.fromJson(json['current'])
    );
  }
}


class Current {

  double? temp; 
  double? feelsLike;

  int? humidity;

  int? clouds;

  double? windSpeed;

  List<Weather>? weather;

  Current({
    
    this.temp,
    this.feelsLike,
    
    this.humidity,
    
    this.clouds,
    
    this.windSpeed,
    
    this.weather,
  });

  factory Current.fromMap(Map<String, dynamic> data) => Current(
       
        temp: (data['temp'] as num?)?.toDouble(),
        feelsLike: (data['feels_like'] as num?)?.toDouble(),

        humidity: data['humidity'] as int?,

        clouds: data['clouds'] as int?,
        
        windSpeed: (data['wind_speed'] as num?)?.toDouble(),

        weather: (data['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {

        'temp': temp,
        'feels_like': feelsLike,

        'humidity': humidity,


        'clouds': clouds,
        'wind_speed': windSpeed,
       'weather': weather?.map((e) => e.toJson()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Current].
  factory Current.fromJson(Map<String,dynamic> data) {
    return Current.fromMap(data);
  }

  /// `dart:convert`
  ///
  /// Converts [Current] to a JSON string.
  String toJson() => json.encode(toMap());
}






class Weather{
  int? id;
  String? main;
  String? description;
  String? icon;


  Weather({this.id, this.main, this.description, this.icon});



  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon']
    );
  }


  Map<String, dynamic> toJson(){
    return {
      'id' : id,
      'main': main,
      'description' : description,
      'icon': icon
    };
  }

}