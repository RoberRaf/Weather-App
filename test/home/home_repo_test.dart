import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/core/services/network/api_client.dart';
import 'package:weather_app/core/services/network/api_error_model.dart';
import 'package:weather_app/core/services/network/endpoints.dart';
import 'package:weather_app/features/home/data/models/city_weather_response_model.dart';
import 'package:weather_app/features/home/data/repo/home_repo.dart';

import '../fake_json.dart';
import 'home_repo_test.mocks.dart';
// class MockApiClient extends Mock implements ApiClient {}

@GenerateMocks([ApiClient])
void main() async {
  await dotenv.load(fileName: "assets/.env");
  group('testing home repo logic', () {
    final apiClient = MockApiClient();
    final homeRepo = HomeRepo(apiClient);
    const cityName = "city";
    final emptyCityName = "";
    final queryParameters = {"q": cityName, "units": "metric", "appid": dotenv.env['API_KEY']};
    final emptyQueryParameters = {"q": emptyCityName, "units": "metric", "appid": dotenv.env['API_KEY']};

    test(
      'returns CityWeatherResponseModel object with null error if the call with city name completes successfully ',
      () async {
        when(apiClient.get(endpoint: Endpoints.weather, queryParameters: queryParameters)).thenAnswer((_) async {
          return (
            response: Response(data: FakeJsons.cityWeatherResponse, requestOptions: RequestOptions()),
            error: null,
          );
        });
        final result = await homeRepo.getCityWeather(cityName);
        expect(result, isInstanceOf<({CityWeatherResponseModel city, Null error})>());
        expect(result.city, isNotNull);
        expect(result.error, isNull);
      },
    );
    test('returns ApiErrorModel instance and null city if the call with city name completes with an error ', () async {
      when(apiClient.get(endpoint: Endpoints.weather, queryParameters: queryParameters)).thenAnswer((_) async {
        return (response: null, error: ApiErrorModel());
      });
      final result = await homeRepo.getCityWeather(cityName);
      expect(result, isInstanceOf<({Null city, ApiErrorModel error})>());
      expect(result.city, isNull);
      expect(result.error, isNotNull);
    });
    test(
      'returns ApiErrorModle instance and null city if the call with empty city name completes with an error ',
      () async {
        when(apiClient.get(endpoint: Endpoints.weather, queryParameters: emptyQueryParameters)).thenAnswer((_) async {
          return (response: null, error: ApiErrorModel());
        });
        final result = await homeRepo.getCityWeather(emptyCityName);
        expect(result, isInstanceOf<({Null city, ApiErrorModel error})>());
        expect(result.city, isNull);
        expect(result.error, isNotNull);
      },
    );
  });
}
