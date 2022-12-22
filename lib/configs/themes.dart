import 'package:flukit/flukit.dart';
import 'package:google_fonts/google_fonts.dart';

enum AppThemes { blue }

final Map<AppThemes, FluThemeBuilder> appThemeBuilders = {
  AppThemes.blue: _defaultThemeBuilder.copyWith()
};

final FluThemeBuilder _defaultThemeBuilder = FluThemeBuilder(
  bodyTextStyle: GoogleFonts.spaceGrotesk(),
  headingTextStyle: GoogleFonts.arvo(),
);
