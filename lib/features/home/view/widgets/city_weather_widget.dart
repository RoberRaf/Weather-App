import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:weather_app/core/helpers/spacing.dart';
import 'package:weather_app/core/resources/assets.dart';
import 'package:weather_app/core/theming/text_styles.dart';
import 'package:weather_app/features/general_widgets/custom_network_image.dart';
import 'package:weather_app/features/home/data/models/city_weather_dto.dart';
import 'package:weather_app/features/home/data/models/city_weather_response_model.dart';

class CityWeatherWidget extends StatelessWidget {
  const CityWeatherWidget({super.key, required this.cityWeather});
  final CityWeatherDTO cityWeather;
  @override
  Widget build(BuildContext context) {
    final iconTitleValueList = [
      (Assets.assetsSvgHumidity, "Humidity", "${cityWeather.humidity}%"),
      (Assets.assetsSvgTemp, "Temperature", "${cityWeather.temperature}°C"),
      (Assets.assetsSvgWind, "Wind", "${cityWeather.windSpeed} m/s"),
    ];
    return Column(
      spacing: 16,
      children: [
        Text(cityWeather.cityName ?? '', style: TStyle.darkBold(18)),
        DecoratedBox(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.black12)),
          child: CustomNetworkImage(cityWeather.icon ?? '', width: 150, fit: BoxFit.fill),
        ),
        Text.rich(
          TextSpan(
            style: TStyle.greySemi(14),
            children: [
              for (final weather in cityWeather.weatherList ?? <WeatherModel>[])
                if (weather.main != null) ...[
                  TextSpan(text: "${weather.main}", style: TStyle.darkBold(16)),
                  TextSpan(text: "\n${weather.description}"),
                ],
            ],
          ),
          textAlign: TextAlign.center,
        ),

        const VerticalSpacing(12),
        SizedBox(
          height: 100,
          child: LayoutBuilder(
            builder: (context, constrins) {
              return ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: iconTitleValueList.length,
                separatorBuilder:
                    (context, index) => const VerticalDivider(color: Colors.black26, indent: 50, endIndent: 10, width: 1),
                itemBuilder: (context, index) {
                  final item = iconTitleValueList[index];
                  return SizedBox(
                    width: (constrins.maxWidth - 2) / 3,
                    child: Column(
                      children: [
                        Skeleton.shade(child: SvgPicture.asset(item.$1, width: 40, height: 40)),
                        const VerticalSpacing(12),
                        Text(item.$2, style: TStyle.greySemi(14)),
                        Text(item.$3, style: TStyle.darkBold(16)),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
