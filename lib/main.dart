import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/core/cubit/bloc_observer.dart';
import 'package:weather_app/core/di/di.dart';
import 'package:weather_app/weather_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  await dotenv.load(fileName: "assets/.env");
  Bloc.observer = MyBlocObserver();
  runApp(const WeatherApp());
}
