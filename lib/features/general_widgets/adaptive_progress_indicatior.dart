import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/theming/app_colors.dart';

class AdaptiveProgressIndicator extends StatelessWidget {
  const AdaptiveProgressIndicator({super.key, this.color, this.radius});
  final Color? color;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? SizedBox(
          height: (radius ?? 24) * 2,
          width: (radius ?? 24) * 2,
          child: CircularProgressIndicator(color: color ?? Co.primary),
        )
        : CupertinoActivityIndicator(color: color ?? Co.primary, radius: radius ?? 24);
  }
}
