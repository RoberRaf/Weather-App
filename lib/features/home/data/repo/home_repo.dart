import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/core/services/network/api_client.dart';
import 'package:weather_app/core/services/network/api_error_model.dart';
import 'package:weather_app/core/services/network/endpoints.dart';
import 'package:weather_app/features/home/data/models/city_weather_response_model.dart';

class HomeRepo {
  final ApiClient _apiClient;
  HomeRepo(this._apiClient);
  Future<({CityWeatherResponseModel? city, ApiErrorModel? error})> getCityWeather(String cityName) async {
    final queryParameters = {"q": cityName, "units": "metric", "appid": dotenv.env['API_KEY']};
    final response = await _apiClient.get(endpoint: Endpoints.weather, queryParameters: queryParameters);
    if (response.error == null) {
      try {
        final cityWeatherResponseModel = CityWeatherResponseModel.fromJson(response.response!.data);
        return (city: cityWeatherResponseModel, error: null);
      } catch (e) {
        return (city: null, error: ApiErrorModel(message: "Error parsing data"));
      }
    }
    return (city: null, error: response.error);
  }
}
