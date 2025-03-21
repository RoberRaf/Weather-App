import 'package:weather_app/core/services/network/api_error_model.dart';
import 'package:weather_app/features/home/data/models/city_weather_dto.dart';

abstract class HomeStates {}

class HomeInitial extends HomeStates {}

class HomeLoading extends HomeStates {}

class HomeLoaded extends HomeStates {
  final CityWeatherDTO city;
  HomeLoaded(this.city);
}

class HomeError extends HomeStates {
  final ApiErrorModel error;
  HomeError(this.error);
}
