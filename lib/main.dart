import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_booking/splash_screen.dart';
import 'package:parking_booking/user_login_screen.dart';

// ------------------------------------------------------------
// ⭐ GLOBAL SMOOTH NAVIGATION (USED BY ENTIRE APPLICATION)
// ------------------------------------------------------------
void pushSmooth(BuildContext context, Widget page) {
  Navigator.of(context).push(
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 260),
      reverseTransitionDuration: const Duration(milliseconds: 220),
      pageBuilder: (_, animation, secondaryAnimation) => FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.96, end: 1.0).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutCubic,
            ),
          ),
          child: page,
        ),
      ),
    ),
  );
}
// ------------------------------------------------------------

// --- THEME COLORS ---
class AppColors {
  static const Color appBackground =
      Color(0xFF1C1C1E); // ADDED COMMENT IMPROVED
  static const Color cardSurface = Color(0xFF2C2C2E);
  static const Color appBarColor = Color(0xFF1C1C1E);
  static const Color searchBarColor = Color(0xFF2C2C2E);
  static const Color infoItemBg = Color(0xFF3A3A3C);

  static const Color primaryText = Color(0xFFFFFFFF);
  static const Color secondaryText = Color(0xFFB0B0B5);
  static const Color hintText = Color(0xFF8E8E93);
  static const Color darkText = Color(0xFF000000);

  static const Color markerColor = Color(0xFF0A84FF);
  static const Color routeColor = Color(0xFF5AC8FA);
  static const Color outlinedButtonColor = Color(0xFF8E8E93);
  static const Color elevatedButtonBg = Color(0xFFFFFFFF);

  static const Color shadow = Color.fromRGBO(0, 0, 0, 0.3);
  static const Color errorRed = Color(0xFFD32F2F);
}
// --- END THEME COLORS ---

void main() {
  runApp(const ParkingApp());
}

class ParkingApp extends StatelessWidget {
  const ParkingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Parking Booking',

      // --- DARK THEME DEFINITION ---
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.markerColor,
        scaffoldBackgroundColor: AppColors.appBackground,
        fontFamily: GoogleFonts.poppins().fontFamily,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.markerColor,
          secondary: AppColors.routeColor,
          background: AppColors.appBackground,
          surface: AppColors.cardSurface,
          onPrimary: AppColors.primaryText,
          onSecondary: AppColors.primaryText,
          onBackground: AppColors.primaryText,
          onSurface: AppColors.primaryText,
          error: AppColors.errorRed,
          onError: AppColors.primaryText,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.appBarColor,
          foregroundColor: AppColors.primaryText,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryText,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.elevatedButtonBg,
            foregroundColor: AppColors.darkText,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primaryText,
            side: const BorderSide(color: AppColors.outlinedButtonColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.markerColor,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(color: AppColors.hintText),
          hintStyle: const TextStyle(color: AppColors.hintText),
          prefixIconColor: AppColors.hintText,
          filled: true,
          fillColor: AppColors.cardSurface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.outlinedButtonColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primaryText),
          ),
        ),
        cardTheme: CardThemeData(
          color: AppColors.cardSurface,
          elevation: 4,
          shadowColor: AppColors.shadow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColors.markerColor,
          selectionColor: AppColors.markerColor,
          selectionHandleColor: AppColors.markerColor,
        ),
      ),
      // --- END THEME ---

      home: const SplashScreen(),
    );
  }
}
