import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
    useMaterial3: true, // Enable Material 3
    splashColor: Colors.transparent,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue, // Primary color seed
      brightness: Brightness.light, // Light theme
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true, // Center the title in the AppBar
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor:
          ThemeData.light().colorScheme.surface, // Use surface color

      selectedItemColor: ThemeData.light()
          .colorScheme
          .primary, // Use primary color for selected item
      unselectedItemColor: ThemeData.light()
          .colorScheme
          .onSurface
          .withOpacity(0.6), // Use onSurface with opacity for unselected items
      elevation: 2, // Add a slight elevation
      type: BottomNavigationBarType
          .fixed, // Fixed type for better Material 3 alignment
      showUnselectedLabels: true, // Show labels for unselected items
      showSelectedLabels: true, // Show labels for selected items
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
      //
      titleLarge: TextStyle(
          color: Color(0xA0515155), fontSize: 14, fontWeight: FontWeight.w400),
      titleMedium: TextStyle(
          color: Color(0xA0515155), fontSize: 14, fontWeight: FontWeight.w400),
      titleSmall: TextStyle(
          color: Color(0xA0515155), fontSize: 14, fontWeight: FontWeight.w400),
    ));

final ThemeData darkTheme = ThemeData(
  useMaterial3: true, // Enable Material 3
  splashColor: Colors.transparent,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue, // Primary color seed
    brightness: Brightness.dark, // Dark theme
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: true, // Center the title in the AppBar
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: ThemeData.dark().colorScheme.surface, // Use surface color

    selectedItemColor: ThemeData.dark()
        .colorScheme
        .primary, // Use primary color for selected item
    unselectedItemColor: ThemeData.dark()
        .colorScheme
        .onSurface
        .withOpacity(0.6), // Use onSurface with opacity for unselected items
    elevation: 2, // Add a slight elevation
    type: BottomNavigationBarType
        .fixed, // Fixed type for better Material 3 alignment
    showUnselectedLabels: true, // Show labels for unselected items
    showSelectedLabels: true, // Show labels for selected items
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
    //
    titleLarge: TextStyle(
        color: Color.fromARGB(159, 21, 21, 21),
        fontSize: 14,
        fontWeight: FontWeight.w400),
    titleMedium: TextStyle(
        color: Color.fromARGB(159, 21, 21, 21),
        fontSize: 14,
        fontWeight: FontWeight.w400),
    titleSmall: TextStyle(
        color: Color.fromARGB(159, 21, 21, 21),
        fontSize: 14,
        fontWeight: FontWeight.w400),
  ),
);

ThemeData pinkTheme = lightTheme.copyWith(
    primaryColor: const Color(0xFFF49FB6),
    scaffoldBackgroundColor: const Color(0xFFFAF8F0),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Color(0xFF24737c),
      backgroundColor: Color(0xFFA6E0DE),
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        color: Colors.black87,
      ),
    ));

ThemeData halloweenTheme = lightTheme.copyWith(
  primaryColor: const Color(0xFF55705A),
  scaffoldBackgroundColor: const Color(0xFFE48873),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Color(0xFFea8e71),
    backgroundColor: Color(0xFF2b2119),
  ),
);

ThemeData darkBlueTheme = ThemeData.dark().copyWith(
  primaryColor: const Color(0xFF1E1E2C),
  scaffoldBackgroundColor: const Color(0xFF2D2D44),
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      color: Color(0xFF33E1Ed),
    ),
  ),
);
