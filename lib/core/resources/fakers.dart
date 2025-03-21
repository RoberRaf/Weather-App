import 'package:weather_app/features/home/data/models/city_weather_dto.dart';
import 'package:weather_app/features/home/data/models/city_weather_response_model.dart';

class Fakers {
  Fakers._();
  static final cityWeatherDTO = CityWeatherDTO(
    cityName: 'City Name',
    temperature: 25,
    weatherList: [WeatherModel(main: 'Main', description: 'Description', icon: '10d')],
    windSpeed: 5,
    humidity: 50,
  );
}
