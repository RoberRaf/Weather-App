import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:weather_app/core/helpers/app_consts.dart';
import 'package:weather_app/core/helpers/spacing.dart';
import 'package:weather_app/core/helpers/validators.dart';
import 'package:weather_app/core/resources/fakers.dart';
import 'package:weather_app/core/theming/text_styles.dart';
import 'package:weather_app/features/general_widgets/failed_widget.dart';
import 'package:weather_app/features/general_widgets/main_button.dart';
import 'package:weather_app/features/general_widgets/main_text_field.dart';
import 'package:weather_app/features/home/logic/home_cubit.dart';
import 'package:weather_app/features/home/logic/home_state.dart';
import 'package:weather_app/features/home/view/widgets/city_weather_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text("Weather App", style: TStyle.darkBold(18)), centerTitle: true,
      surfaceTintColor: Colors.transparent,
      ),
      body: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          return ListView(
            physics: const ClampingScrollPhysics(),
            padding: AppConsts.defaultPadding,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Form(
                        key: _formKey,
                        child: MainTextField(
                          controller: searchController,
                          label: "City name",
                          hintText: 'Ex: Cairo',
                          enabled: state is! HomeLoading,
                          validator: Validators.notEmpty,
                        ),
                      ),
                    ),
                    Expanded(
                      child: MainButton(
                        text: 'check',
                        isLoading: state is HomeLoading,
                        ontap: () async {
                          if (_formKey.currentState?.validate() != true) return;
                          await context.read<HomeCubit>().getCityWeather(searchController.text);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const VerticalSpacing(40),
              if (state is HomeInitial)
                Center(
                  child: Column(
                    spacing: 20,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(CupertinoIcons.search, size: 100, color: Colors.black26),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: "Welcome to Weather app\n", style: TStyle.darkBold(16)),
                            TextSpan(text: "Check the weather of any city you want", style: TStyle.greySemi(15)),
                          ],
                        ),
                        textAlign: TextAlign.center,
                        style: TStyle.darkSemi(14),
                      ),
                    ],
                  ),
                )
              else if (state is HomeLoaded || state is HomeLoading)
                Skeletonizer(
                  enabled: state is HomeLoading,
                  child: CityWeatherWidget(
                    cityWeather: state is HomeLoading ? Fakers.cityWeatherDTO : (state as HomeLoaded).city,
                  ),
                )
              else if (state is HomeError)
                FailedWidget(error: state.error),
            ],
          );
        },
      ),
    );
  }
}
