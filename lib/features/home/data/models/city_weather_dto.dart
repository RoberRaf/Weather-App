import 'package:weather_app/features/home/data/models/city_weather_response_model.dart';

class CityWeatherDTO {
  final String? cityName;
  final num? temperature;
  final List<WeatherModel>? weatherList;
  final num? windSpeed;
  final num? humidity;

  String? get icon {
    if (weatherList?.isNotEmpty != true || weatherList?.first.icon == null) return null;
    return "https://openweathermap.org/img/wn/${weatherList!.first.icon}@2x.png";
  }

  CityWeatherDTO({this.cityName, this.temperature, this.weatherList, this.windSpeed, this.humidity});
}
