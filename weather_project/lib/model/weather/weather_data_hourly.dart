import 'dart:convert';




class WeatherDataHourly{
  List<Hourly> hourly;
  WeatherDataHourly({required this.hourly});

  factory WeatherDataHourly.fromJson(Map<String,dynamic> json){
    return WeatherDataHourly(
      hourly: List<Hourly>.from(json['hourly'].map( (e)=>Hourly.fromJson(e)  ))
    );
  }
}




class Hourly {
  int? dt;
  double? temp;
  List<Weather>? weather;

  Hourly({
    this.dt,
    this.temp,
    this.weather,
   
  });

  factory Hourly.fromMap(Map<String, dynamic> data) => Hourly(
        dt: data['dt'] as int?,
        temp: (data['temp'] as num?)?.toDouble(),
           weather: (data['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
        
      );

  Map<String, dynamic> toMap() => {
        'dt': dt,
        'temp': temp,
        'weather': weather?.map((e) => e.toJson()).toList(),
        
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Hourly].
  factory Hourly.fromJson(Map<String,dynamic> data) {
    return Hourly.fromMap(data);
  }

  /// `dart:convert`
  ///
  /// Converts [Hourly] to a JSON string.
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
