import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/data/repo/home_repo.dart';
import 'package:weather_app/features/home/logic/home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  @override
  void emit(HomeStates state) {
    if (isClosed) return;
    super.emit(state);
  }

  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeInitialState());

  Future<void> getCityWeather(String cityName) async {
    emit(HomeLoadingState());
    final response = await _homeRepo.getCityWeather(cityName);
    if (response.city != null) {
      emit(HomeSuccessState(response.city!.toDTO()));
      return;
    }
    emit(HomeErrorState(response.error!));
  }
}
