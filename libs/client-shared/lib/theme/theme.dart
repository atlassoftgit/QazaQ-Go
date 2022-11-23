import 'package:client_shared/theme/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

mixin CustomTheme {
  static const MaterialColor neutralColors = MaterialColor(
    0xff6f7d98,
    // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xfff2f5fa), //10%
      100: Color(0xffe9ecf5), //20%
      200: Color(0xffdfe4ef), //30%
      300: Color(0xffc2cce0), //40%
      400: Color(0xffa9b5cc), //50%
      500: Color(0xff8c9ab5), //60%
      600: Color(0xff516281), //70%
      700: Color(0xff324260), //80%
      800: Color(0xff172643), //90%
      900: Color(0xff0a1833), //100%
    },
  );
  static const MaterialColor primaryColors = MaterialColor(
    0xff226bf2,
    // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xfffafbfc), //10%
      100: Color(0xffedf3ff), //20%
      200: Color(0xffd0e0ff), //30%
      300: Color(0xffc4d9ff), //40%
      400: Color(0xff89b3ff), //50%
      500: Color(0xff5892fa), //60%
      600: Color(0xff094ac3), //70%
      700: Color(0xff0037a5), //80%
      800: Color(0xff002771), //90%
      900: Color(0xff031e52), //100%
    },
  );

  static const MaterialColor secondaryColors = MaterialColor(
    0xffce6700,
    // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffffefe0), //10%
      100: Color(0xffffdbba), //20%
      200: Color(0xffffc590), //30%
      300: Color(0xffffa757), //40%
      400: Color(0xffef8728), //50%
      500: Color(0xffdd7414), //60%
      600: Color(0xffad5300), //70%
      700: Color(0xff964700), //80%
      800: Color(0xff6c3201), //90%
      900: Color(0xff602e00), //100%
    },
  );

  static const double tabletBreakpoint = 1280;

  static const Color lightGreen = Color(0xff5CDD28);
  static const Color blue = Color(0xff6374DF);
  static const Color greenLine = Color(0xff5CDD28);
  static const Color renLine = Color(0xffEF2E2E);
  static const Color colorBanana = Color(0xffF1CE65);
  static const Color colorNavy = Color(0xff464F8B);
  static const Color blue5 = Color(0xff6374DF);
  static const Color black41 = Color(0xff414040);

  static final _textTheme = TextTheme(
    displayLarge: MyFont.style(
      color: primaryColors.shade900,
      fontSize: 45,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      letterSpacing: -1.125,
    ),
    displayMedium: MyFont.style(
      color: primaryColors.shade900,
      fontSize: 36,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      letterSpacing: -0.9,
    ),
    displaySmall: MyFont.style(
      color: primaryColors.shade900,
      fontSize: 28,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      letterSpacing: -0.7,
    ),
    headlineLarge: MyFont.style(
      color: neutralColors.shade900,
      fontSize: 22,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      letterSpacing: -0.55,
    ),
    headlineMedium: MyFont.style(
      color: primaryColors.shade900,
      fontSize: 18,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      letterSpacing: -0.45,
    ),
    titleLarge: MyFont.style(
      color: neutralColors.shade800,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      letterSpacing: -0.45,
    ),
    headlineSmall: MyFont.style(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      letterSpacing: -0.4,
    ),
    titleMedium: MyFont.style(
      color: neutralColors.shade800,
      fontSize: 18,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      letterSpacing: -0.4,
    ),
    bodyMedium: MyFont.style(
      color: neutralColors.shade800,
      fontSize: 18,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      letterSpacing: -0.45,
    ),
    bodySmall: MyFont.style(
      color: neutralColors.shade600,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      letterSpacing: -0.4,
    ),
    labelLarge: MyFont.style(
      color: neutralColors,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      letterSpacing: -0.4,
    ),
    titleSmall: MyFont.style(
      color: primaryColors.shade900,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      letterSpacing: -0.35,
    ),
    labelMedium: MyFont.style(
      color: neutralColors,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      letterSpacing: -0.35,
    ),
    labelSmall: MyFont.style(
      color: neutralColors,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      background: Colors.white,
      onBackground: Colors.black,
      primary: blue,
      onPrimary: Colors.white,
      primaryContainer: black41,
      secondary: Colors.white,
      secondaryContainer: Color(0xffD9D9D9),
      onSecondary: Colors.black,
      onSecondaryContainer: Colors.black,
      tertiary: black41,
      onTertiary: Colors.white,
      onTertiaryContainer: Color(0xff727272),
      tertiaryContainer: Color(0xffEC2424),
      surface: Colors.white,
      onSurface: Colors.black,
      error: Colors.white,
      onError: Color(0xffD82A49),
    ),
    textTheme: _textTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      background: Color(0xff414040),
      onBackground: Colors.white,
      primary: blue,
      onPrimary: Colors.white,
      primaryContainer: black41,
      secondary: Color(0xff414040),
      secondaryContainer: Color(0xffD9D9D9), //
      onSecondaryContainer: Colors.white,     //
      onSecondary: Colors.white,
      tertiary: Color(0xffC4CDD8),
      onTertiary: Colors.black,
      onTertiaryContainer: Color(0xffC7C7C7),
      tertiaryContainer: Color(0xffEC2424),
      surface: Color(0xffD82A49),
      onSurface: Colors.black,
      error: Color(0xff414040),
      onError: Color(0xffD82A49),
    ),
    textTheme: _textTheme,
  );

  static final ThemeData theme1 = ThemeData(
    useMaterial3: true,
    //primarySwatch: Palette.kToDark,
    fontFamily: GoogleFonts.comfortaa().fontFamily,
    bottomSheetTheme: const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
      top: Radius.circular(12),
    ))),
    highlightColor: primaryColors.shade200,
    appBarTheme:
        const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark),
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: primaryColors,
        onPrimary: Colors.white,
        secondary: secondaryColors,
        onSecondary: Colors.white,
        error: const Color(0xffB20D0E),
        onError: Colors.white,
        background: primaryColors.shade50,
        onBackground: neutralColors.shade500,
        surface: neutralColors.shade100,
        onSurface: neutralColors.shade700),
    textTheme: _textTheme,
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
      side: BorderSide(color: CustomTheme.neutralColors.shade300),
      borderRadius: BorderRadius.circular(10), // <-- Radius
    ))),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: primaryColors,
            onPrimary: Colors.white,
            textStyle: MyFont.style(
                fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
            shadowColor: CustomTheme.neutralColors.shade50,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // <-- Radius
            ),
            padding: const EdgeInsets.all(16))),
    inputDecorationTheme: InputDecorationTheme(
        fillColor: neutralColors.shade200,
        filled: true,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: primaryColors, width: 1.5)),
        hintStyle: MyFont.style(
            color: neutralColors.shade600,
            fontSize: 16,
            fontWeight: FontWeight.normal),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        )),
  );
}
