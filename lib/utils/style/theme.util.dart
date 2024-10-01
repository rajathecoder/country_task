import 'package:country_task/utils/style/style.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final ThemeData appThemeData = ThemeData(
  useMaterial3: false,
  scaffoldBackgroundColor: Style.colors.white,
  primaryColor: Style.colors.primary,
  splashColor: Style.colors.primary,
  highlightColor: Style.colors.primary,
  fontFamily: 'inter',
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.light,
  ),
  colorScheme: ThemeData()
      .colorScheme
      .copyWith(
        secondary: Style.colors.primary,
        primary: Style.colors.primary,
      )
      .copyWith(secondary: Style.colors.primary),
  textSelectionTheme: TextSelectionThemeData(cursorColor: Style.colors.primary),
);
