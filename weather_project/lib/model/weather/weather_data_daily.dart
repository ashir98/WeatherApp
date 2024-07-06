import 'dart:convert';
import 'temp.dart';




class WeatherDataDaily{
  List<Daily> daily;
  WeatherDataDaily({required this.daily});

  factory WeatherDataDaily.fromJson(Map<String,dynamic> json){
    return WeatherDataDaily(
      daily: List<Daily>.from(json['daily'].map( (e)=>Daily.fromJson(e)  ))
    );
  }
}





class Daily {
  int? dt;
  
  Temp? temp;
  List<Weather>? weather;
  
  Daily({
    this.dt,
    this.temp,
    this.weather,
  });

  factory Daily.fromMap(Map<String, dynamic> data) => Daily(
        dt: data['dt'] as int?,
        temp: data['temp'] == null
            ? null
            : Temp.fromMap(data['temp'] as Map<String, dynamic>),
        
        weather: (data['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
        
      );

  Map<String, dynamic> toMap() => {
        'dt': dt,
        
        'temp': temp?.toMap(),
        
        'weather': weather?.map((e) => e.toJson()).toList(),
        
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Daily].
  factory Daily.fromJson(Map<String,dynamic> data) {
    return Daily.fromMap(data);
  }

  /// `dart:convert`
  ///
  /// Converts [Daily] to a JSON string.
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
