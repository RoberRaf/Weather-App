import 'package:weather_app/features/home/data/models/city_weather_dto.dart';

class CityWeatherResponseModel {
  Coord? coord;
  List<WeatherModel>? weather;
  String? base;
  Main? main;
  int? visibility;
  WindModel? wind;
  CloudsModel? clouds;
  int? dt;
  SysModel? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  CityWeatherResponseModel({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });
  CityWeatherDTO toDTO() {
    return CityWeatherDTO(
      cityName: name,
      temperature: main?.temp,
      weatherList: weather == null ? null : List.of(weather!),
      windSpeed: wind?.speed,
      humidity: main?.humidity?.toDouble(),
    );
  }

  CityWeatherResponseModel.fromJson(Map<String, dynamic> json) {
    coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      weather = <WeatherModel>[];
      json['weather'].forEach((v) {
        weather!.add(WeatherModel.fromJson(v));
      });
    }
    base = json['base'];
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    visibility = json['visibility'];
    wind = json['wind'] != null ? WindModel.fromJson(json['wind']) : null;
    clouds = json['clouds'] != null ? CloudsModel.fromJson(json['clouds']) : null;
    dt = json['dt'];
    sys = json['sys'] != null ? SysModel.fromJson(json['sys']) : null;
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }
}

class Coord {
  double? lon;
  double? lat;

  Coord({this.lon, this.lat});

  Coord.fromJson(Map<String, dynamic> json) {
    lon = double.tryParse(json['lon'].toString());
    lat = double.tryParse(json['lat'].toString());
  }
}

class WeatherModel {
  int? id;
  String? main;
  String? description;
  String? icon;

  WeatherModel({this.id, this.main, this.description, this.icon});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
}

class Main {
  num? temp;
  num? feelsLike;
  num? tempMin;
  num? tempMax;
  num? pressure;
  num? humidity;
  num? seaLevel;
  num? grndLevel;

  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
    seaLevel = json['sea_level'];
    grndLevel = json['grnd_level'];
  }
}

class WindModel {
  num? speed;
  num? deg;

  WindModel({this.speed, this.deg});

  WindModel.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
  }
}

class CloudsModel {
  num? all;

  CloudsModel({this.all});

  CloudsModel.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }
}

class SysModel {
  int? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;

  SysModel({this.type, this.id, this.country, this.sunrise, this.sunset});

  SysModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }
}
