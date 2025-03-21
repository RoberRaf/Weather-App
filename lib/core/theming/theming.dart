import 'package:flutter/material.dart';
import 'package:weather_app/core/helpers/app_consts.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/core/theming/text_styles.dart';

export 'package:weather_app/core/theming/app_colors.dart';
export 'package:weather_app/core/theming/text_styles.dart';

final ThemeData mainTheme = ThemeData(
  // fontFamily: "Pro-Rounded",
  scaffoldBackgroundColor: Co.bgColor,
  appBarTheme: AppBarTheme(
    backgroundColor: Co.white,
    titleTextStyle: TStyle.darkBold(20, isTitle: true),
    centerTitle: true,
    iconTheme: const IconThemeData(color: Co.primary, size: 30),
  ),
  dividerColor: Colors.grey.shade300,
  switchTheme: const SwitchThemeData(
    trackOutlineColor: WidgetStatePropertyAll(Colors.transparent),
    trackColor: WidgetStatePropertyAll(Colors.black12),
  ),
  dialogTheme: DialogTheme(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
  bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
  radioTheme: RadioThemeData(fillColor: WidgetStateColor.resolveWith((states) => Co.primary)),
  checkboxTheme: const CheckboxThemeData(fillColor: WidgetStateProperty.fromMap({WidgetState.selected: Co.primary})),
  cardTheme: CardTheme(
    color: Colors.white,
    clipBehavior: Clip.hardEdge,
    shape: RoundedRectangleBorder(borderRadius: AppConsts.defaultRadius),
  ),
  cardColor: Colors.white,
  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: Colors.white),
  highlightColor: Colors.black12,
  disabledColor: Co.black,
  canvasColor: Colors.white,
  shadowColor: Colors.black12,
  listTileTheme: ListTileThemeData(
    selectedColor: Colors.white,
    dense: true,
    tileColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: AppConsts.defaultRadius,
      side: BorderSide(color: Colors.grey.withAlpha(50), width: 1),
    ),
    contentPadding: EdgeInsets.zero,
  ),
  dropdownMenuTheme: DropdownMenuThemeData(
    menuStyle: MenuStyle(
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      backgroundColor: const WidgetStatePropertyAll(Co.white),
    ),
  ),
);

// ThemeData get darkTheme => mainTheme.copyWith(
//     scaffoldBackgroundColor: MyTh.dark300,
//     bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: MyTh.dark200),
//     highlightColor: Colors.white,
//     disabledColor: Co.lightGrey,
//     canvasColor: Co.black,
//     shadowColor: Colors.white12);
