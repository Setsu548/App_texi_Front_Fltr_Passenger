import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFFFFD600), // Amarillo
  onPrimary: Color(0xFF000000), // Texto sobre amarillo
  primaryContainer: Color(0xFFFFF176), // Amarillo claro
  onPrimaryContainer: Color(0xFF000000),
  secondary: Color(0xFF212121), // Fondo oscuro secundario
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFF424242),
  onSecondaryContainer: Color(0xFFFFFFFF),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFF000000), // Fondo negro
  onBackground: Color(0xFFFFFFFF), // Texto blanco
  surface: Color(0xFF121212), // Superficies
  onSurface: Color(0xFFFFFFFF),
  outline: Color(0xFF424242), // Bordes grises
  surfaceVariant: Color(0xFF2C2C2C),
  surfaceTint: Color(0xFFFFFFFF), // Texto blanco
);

class MainTheme {
  static ThemeData light() {
    var theme = ThemeData(
      fontFamily: 'Nexa',
      useMaterial3: true,
      colorScheme: lightColorScheme,
      scaffoldBackgroundColor: lightColorScheme.background,
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 22),
        bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
        labelLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(lightColorScheme.primary),
          foregroundColor: MaterialStateProperty.all(lightColorScheme.onPrimary),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 14, horizontal: 24)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: lightColorScheme.surface,
        hintStyle: TextStyle(color: Colors.white70),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: lightColorScheme.outline, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: lightColorScheme.primary, width: 2),
        ),
      ),
    );

    return theme;
  }

  static void setStatusBarColor() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }
}
