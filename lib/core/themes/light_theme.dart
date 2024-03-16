import 'package:amritha_ayurveda/core/themes/color_palette.dart';
import 'package:amritha_ayurveda/core/themes/extensions/boxshadow_extension.dart';
import 'package:amritha_ayurveda/core/themes/extensions/color_extension.dart';
import 'package:amritha_ayurveda/core/themes/extensions/space_extension.dart';
import 'package:amritha_ayurveda/core/themes/extensions/typography_extension.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'light_theme.g.dart';

final _lightTheme = ThemeData(
  brightness: Brightness.light,
  extensions: [
    AppColorExtension(
      primary: AppColorPalette.green,
      secondary: AppColorPalette.white,
      text: AppColorPalette.blue900,
      textInverse: AppColorPalette.gray200,
      textSubtle: AppColorPalette.gray300,
      textSubtlest: AppColorPalette.grey400,
      textDisabled: AppColorPalette.grey350,
    ),
    AppSpaceExtension.fromBaseSpace(8),
    AppTypographyExtension.fromColors(
      defaultFontColor: AppColorPalette.blue900,
      linkColor: Colors.blue,
      dimFontColor: AppColorPalette.grey400,
    ),
    AppBoxShadowExtension(
        primary: BoxShadow(
          blurRadius: 34,
          spreadRadius: -10,
          color: Colors.black.withOpacity(0.1),
        ),
        secondary: BoxShadow(
          blurRadius: 20,
          spreadRadius: -10,
          color: Colors.black.withOpacity(0.2),
        ))
  ],
);

@riverpod
ThemeData lightTheme(LightThemeRef ref) {
  return _lightTheme;
}
