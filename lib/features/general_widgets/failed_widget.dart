import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/core/resources/assets.dart';
import 'package:weather_app/core/services/network/api_error_model.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/core/theming/text_styles.dart';

class FailedWidget extends StatelessWidget {
  const FailedWidget({super.key, required this.error, this.btnPad, this.imgeSize});
  final ApiErrorModel error;

  final EdgeInsets? btnPad;
  final double? imgeSize;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 20,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            Assets.assetsSvgError,
            height: imgeSize ?? 140,
            fit: BoxFit.fitHeight,
            colorFilter:  const ColorFilter.mode(Co.lightPrimaryWzOp, BlendMode.srcIn),
          ),
          Text((error.message ?? error.formErrors)?.toUpperCase() ?? '', style: TStyle.darkBold(16)),
        ],
      ),
    );
  }
}
