import 'package:get_it/get_it.dart';
import 'package:weather_app/core/services/network/api_client.dart';
import 'package:weather_app/features/home/data/repo/home_repo.dart';
import 'package:weather_app/features/home/logic/home_cubit.dart';

final di = GetIt.instance;

Future<void> init() async {
  di.registerLazySingleton(() => HomeRepo(ApiClient()));
  di.registerFactory<HomeCubit>(() => HomeCubit(di()));
}
