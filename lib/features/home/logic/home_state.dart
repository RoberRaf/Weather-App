import 'package:weather_app/core/services/network/api_error_model.dart';
import 'package:weather_app/features/home/data/models/city_weather_dto.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeSuccessState extends HomeStates {
  final CityWeatherDTO city;
  HomeSuccessState(this.city);
}

class HomeErrorState extends HomeStates {
  final ApiErrorModel error;
  HomeErrorState(this.error);
}
