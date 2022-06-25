import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class ApplicationTheme {
  static const headline2FontSize = 24.0;
  static const headline3FontSize = 20.0;
  static const headline5FontSize = 17.0;
  static const subtitle2FontSize = 18.0;
  static const captionFontSize = 14.0;
  static const buttonFontSize = 16.0;
  static const double basePadding = 24;

  static final altButtonStyle = TextButton.styleFrom(
    primary: const Color(0xff0c69ae),
    textStyle: const TextStyle(
      fontSize: captionFontSize,
      color: Color(0xff0c69ae),
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline,
      decorationThickness: 2,
    ),
  );

  static const keyDynamicSubTitle = TextStyle(
    fontSize: 17,
    color: Color(0xff6E6D7A),
    fontWeight: FontWeight.w400,
    decorationThickness: 2,
    fontFamily: "Roboto",
  );

  static const keyDynamicBigNumberBody = TextStyle(
    fontSize: 60,
    color: Color(0xff333336),
    fontWeight: FontWeight.w300,
    decorationThickness: 2,
    fontFamily: "Roboto",
  );

  static final BoxDecoration keyImageBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(50),
    color: const Color(0xffE7F0F7),
  );

  static final ThemeData light = ThemeData.light().copyWith(
    primaryColor: const Color(0xff0c69ae),
    primaryColorDark: const Color(0xff003c69),
    primaryColorLight: const Color(0xff11c2cd),
    textTheme: _lightTextTheme(),
    errorColor: const Color(0xffed2939),
    disabledColor: const Color(0xff606166),
    highlightColor: const Color(0xffdce0fa),
    scaffoldBackgroundColor: Colors.white,
    canvasColor: Colors.transparent,
    appBarTheme: const AppBarTheme(centerTitle: true, color: Color(0xff003c69)),
  );

  static final ThemeData dark = ThemeData.dark().copyWith(
    primaryColor: const Color(0xff0c69ae),
    primaryColorDark: const Color(0xff003c69),
    primaryColorLight: const Color(0xff11c2cd),
    textTheme: _darkTextTheme(),
    errorColor: const Color(0xffed2939),
    disabledColor: const Color(0xff606166),
    highlightColor: const Color(0xffdce0fa),
    scaffoldBackgroundColor: const Color(0xff181818),
  );

  static TextTheme _darkTextTheme() {
    return GoogleFonts.robotoTextTheme().copyWith(
      headline2: GoogleFonts.robotoTextTheme().headline2?.copyWith(
          fontSize: headline2FontSize,
          color: Colors.white,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.05),
      subtitle2: GoogleFonts.robotoTextTheme().subtitle2?.copyWith(
          fontSize: subtitle2FontSize,
          color: Colors.white,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.05),
      caption: GoogleFonts.robotoTextTheme()
          .caption
          ?.copyWith(color: Colors.white, fontSize: captionFontSize),
      button:
          GoogleFonts.robotoTextTheme().button?.copyWith(color: Colors.white),
    );
  }

  static TextTheme _lightTextTheme() {
    return GoogleFonts.robotoTextTheme().copyWith(
      headline2: GoogleFonts.robotoTextTheme().headline2?.copyWith(
          fontSize: headline2FontSize,
          color: const Color(0xff333336),
          fontWeight: FontWeight.w700),
      headline3: GoogleFonts.robotoTextTheme().headline3?.copyWith(
          fontSize: headline3FontSize + 2,
          color: const Color(0xff333336),
          fontWeight: FontWeight.w700),
      headline5: GoogleFonts.robotoTextTheme().headline5?.copyWith(
          fontSize: headline5FontSize,
          height: 1.3,
          color: const Color(0xff333336),
          fontWeight: FontWeight.w400),
      caption: GoogleFonts.robotoTextTheme()
          .caption
          ?.copyWith(color: const Color(0xff333336), fontSize: buttonFontSize),
      button: GoogleFonts.robotoTextTheme().button?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.05,
          fontSize: buttonFontSize),
    );
  }
}
