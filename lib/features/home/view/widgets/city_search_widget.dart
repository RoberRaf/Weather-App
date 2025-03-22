import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/helpers/validators.dart';
import 'package:weather_app/features/general_widgets/main_button.dart';
import 'package:weather_app/features/general_widgets/main_text_field.dart';
import 'package:weather_app/features/home/logic/home_cubit.dart';
import 'package:weather_app/features/home/logic/home_state.dart';

class CitySearchWidget extends StatefulWidget {
  const CitySearchWidget({super.key});

  @override
  State<CitySearchWidget> createState() => _CitySearchWidgetState();
}

class _CitySearchWidgetState extends State<CitySearchWidget> {
  final searchController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          return Row(
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
                    enabled: state is! HomeLoadingState,
                    validator: Validators.validCityName,
                  ),
                ),
              ),
              Expanded(
                child: MainButton(
                  text: 'check',
                  isLoading: state is HomeLoadingState,
                  ontap: () async {
                    if (_formKey.currentState?.validate() != true) return;
                    // await context.read<HomeCubit>().getCityWeather(searchController.text);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
