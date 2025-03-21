import 'package:flutter/material.dart';

abstract class AppConsts {
  AppConsts._();
  static const maxWidth = 650.0;

  // static const double defaultBorderRadius = 10;
  static BorderRadius defaultRadius = BorderRadius.circular(5);
  static BorderRadius defaultInnerRadius = BorderRadius.circular(16);

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static List<BoxShadow> generalShadow({double? opacity, Color? color, Offset? offset}) => [
    BoxShadow(
      color: (color ?? Colors.black).withAlpha((opacity ?? 0.1 * 255).toInt()),
      blurRadius: 4,
      spreadRadius: 4,
      offset: offset ?? const Offset(0, 0),
    ),
  ];

  static final defaultPadding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  static final defaultHorPadding = const EdgeInsets.symmetric(horizontal: 16);
}
