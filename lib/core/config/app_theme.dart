import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData buildTheme([Brightness brightness = Brightness.light]) {
  var baseTheme = brightness == Brightness.light
      ? ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xfff90653),
            dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
            brightness: brightness,
            outline: const Color(0x1a8c8a8a),
            outlineVariant: Color(0xfff3f3f3),
            primary: const Color(0xfff90653),
            onPrimary: Colors.white,
            primaryContainer: Color(0x33f90653),
            onPrimaryContainer: Colors.black,
            secondary: const Color(0xff8c8a8a),
            onSecondary: Colors.black,
            tertiary: Color(0xff707070),
            onTertiary: Colors.white,
            surface: const Color(0xfffafafa),
            onSurface: Colors.black,
          ),
        )
      : ThemeData(
          brightness: brightness, colorSchemeSeed: const Color(0xfff90653));

  return baseTheme.copyWith(
    textTheme: GoogleFonts.instrumentSansTextTheme(baseTheme.textTheme),
    appBarTheme: AppBarTheme(centerTitle: true),
    inputDecorationTheme: InputDecorationTheme(
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: baseTheme.colorScheme.secondary, width: 1.5),
        ),
        filled: true,
        fillColor: baseTheme.colorScheme.surface,
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: baseTheme.colorScheme.primary, width: 1.5),
        ),
        hintStyle:
            TextStyle(fontSize: baseTheme.textTheme.bodyMedium?.fontSize),
        prefixIconColor: baseTheme.colorScheme.secondary),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          minimumSize: const Size(64, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          side: BorderSide(
            color: baseTheme.colorScheme.primary,
          )),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: baseTheme.colorScheme.primary,
        foregroundColor: baseTheme.colorScheme.onPrimary,
      ),
    ),
  );
}
