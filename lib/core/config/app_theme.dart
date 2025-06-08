import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData buildTheme(Brightness brightness) {
  var baseTheme = brightness == Brightness.light
      ? ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xfff90653),
            dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
            brightness: brightness,
            outline: const Color(0x1a8c8a8a),
            primary: const Color(0xfff90653),
            secondary: const Color(0xff8c8a8a),
            tertiary: Color(0xff707070),
            surface: const Color(0xfffafafa),
            onSurface: Colors.black,
          ),
        )
      : ThemeData(
          brightness: brightness, colorSchemeSeed: const Color(0xfff90653));

  return baseTheme.copyWith(
    textTheme: GoogleFonts.instrumentSansTextTheme(baseTheme.textTheme),
  );
}
