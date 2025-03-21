import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/di/di.dart';
import 'package:weather_app/core/theming/theming.dart';
import 'package:weather_app/features/home/logic/home_cubit.dart';
import 'package:weather_app/features/home/view/home_screen.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
      child: MaterialApp(
        title: "Weather App",
        theme: mainTheme,
        debugShowCheckedModeBanner: false,
        home: BlocProvider(create: (context) => di<HomeCubit>(), child: const HomeScreen()),
        builder: (context, child) {
          return child!;
          // return Stack(children: [child!, NoInternetWidget()])!;
        },
      ),
    );
  }
}
