import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/core/services/network/api_error_model.dart';
import 'package:weather_app/features/home/data/models/city_weather_response_model.dart';
import 'package:weather_app/features/home/data/repo/home_repo.dart';
import 'package:weather_app/features/home/logic/home_cubit.dart';
import 'package:weather_app/features/home/logic/home_state.dart';

import 'home_cubit_test.mocks.dart';

@GenerateMocks([HomeRepo])
void main() async {
  await dotenv.load(fileName: "assets/.env");
  group('test HomeCubit logic', () {
    late MockHomeRepo repo;
    late HomeCubit cubit;
    const cityName = "city";
    const emptyCityName = "";

    setUp(() {
      repo = MockHomeRepo();
      cubit = HomeCubit(repo);
    });
    tearDown(() => cubit.close());

    test('test cubit initial state', () {
      expect(cubit.state, isInstanceOf<HomeInitialState>());
    });

    blocTest<HomeCubit, HomeStates>(
      'test getCityWeather method with city name that completes with success',
      setUp: () {
        when(repo.getCityWeather(cityName)).thenAnswer((_) async {
          return (city: CityWeatherResponseModel(), error: null);
        });
      },
      build: () => cubit,
      act: (bloc) => bloc.getCityWeather(cityName),
      expect: () => [isInstanceOf<HomeLoadingState>(), isInstanceOf<HomeSuccessState>()],
      verify: (_) => verify(repo.getCityWeather(cityName)).called(1),
    );
    blocTest<HomeCubit, HomeStates>(
      'test getCityWeather method with city name that completes with error',
      setUp: () {
        when(repo.getCityWeather(cityName)).thenAnswer((_) async {
          return (city: null, error: ApiErrorModel());
        });
      },
      build: () => cubit,
      act: (bloc) => bloc.getCityWeather(cityName),
      expect: () => [isInstanceOf<HomeLoadingState>(), isInstanceOf<HomeErrorState>()],
      verify: (_) => verify(repo.getCityWeather(cityName)).called(1),
    );
    blocTest<HomeCubit, HomeStates>(
      'test getCityWeather method with empty city name that completes with error',
      setUp: () {
        when(repo.getCityWeather(emptyCityName)).thenAnswer((_) async {
          return (city: null, error: ApiErrorModel());
        });
      },
      build: () => cubit,
      act: (bloc) => bloc.getCityWeather(emptyCityName),
      expect: () => [isInstanceOf<HomeLoadingState>(), isInstanceOf<HomeErrorState>()],
      verify: (_) => verify(repo.getCityWeather(emptyCityName)).called(1),
    );
  });
}
