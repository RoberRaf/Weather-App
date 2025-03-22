import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:weather_app/core/helpers/app_consts.dart';
import 'package:weather_app/core/helpers/spacing.dart';
import 'package:weather_app/core/resources/fakers.dart';
import 'package:weather_app/core/theming/text_styles.dart';
import 'package:weather_app/features/general_widgets/failed_widget.dart';
import 'package:weather_app/features/home/logic/home_cubit.dart';
import 'package:weather_app/features/home/logic/home_state.dart';
import 'package:weather_app/features/home/view/widgets/city_search_widget.dart';
import 'package:weather_app/features/home/view/widgets/city_weather_widget.dart';
import 'package:weather_app/features/home/view/widgets/welcome_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Weather App", style: TStyle.darkBold(18)),
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: ListView(
          physics: const ClampingScrollPhysics(),
          padding: AppConsts.defaultPadding,
          children: [
            const CitySearchWidget(),
            const VerticalSpacing(40),
            BlocBuilder<HomeCubit, HomeStates>(
              builder: (context, state) {
                if (state is HomeErrorState) {
                  return FailedWidget(error: state.error);
                } else if (state is HomeSuccessState || state is HomeLoadingState) {
                  return Skeletonizer(
                    enabled: state is HomeLoadingState,
                    child: CityWeatherWidget(
                      cityWeather: state is HomeLoadingState ? Fakers.cityWeatherDTO : (state as HomeSuccessState).city,
                    ),
                  );
                } else {
                  return const WelcomeWidget();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
