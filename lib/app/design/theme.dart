import 'package:fitness_app/app/design/design_tokens.dart';
import 'package:flutter/material.dart';

ThemeData buildTheme() {
  final base = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: DesignTokens.cardBlue,
    brightness: Brightness.light,
  );

  return base.copyWith(
    scaffoldBackgroundColor: DesignTokens.bg,
    textTheme: base.textTheme.apply(
      bodyColor: DesignTokens.text,
      displayColor: DesignTokens.text,
    ),
    cardTheme: CardThemeData(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(DesignTokens.radiusCard),
        ),
      ),
    ),
  );
}
