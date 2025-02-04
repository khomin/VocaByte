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
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
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
  ),
);

// ThemeData lightTheme = ThemeData.light();

// ThemeData darkTheme = ThemeData.dark();

// ThemeData lightTheme = ThemeData.light().copyWith(
//     primaryColor: const Color(0xFFFAF8F0),
//     scaffoldBackgroundColor: const Color(0xFFFAF8F0),
//     floatingActionButtonTheme: const FloatingActionButtonThemeData(
//       foregroundColor: Color(0xFF24737c),
//       backgroundColor: Color(0xFFA6E0DE),
//     ),
//     splashColor: Colors.transparent,
//     textTheme: const TextTheme(
//         bodySmall: TextStyle(
//           color: Colors.black87,
//         ),
//         bodyLarge: TextStyle(
//           color: Colors.black87,
//         ),
//         bodyMedium: TextStyle(
//           color: Colors.black87,
//         )));

// ThemeData darkTheme = ThemeData.dark().copyWith(
//   primaryColor: const Color.fromARGB(255, 0, 0, 0),
//   scaffoldBackgroundColor: const Color(0xFFE48873),
//   floatingActionButtonTheme: const FloatingActionButtonThemeData(
//     foregroundColor: Color(0xFFea8e71),
//     backgroundColor: Color(0xFF2b2119),
//   ),
//   splashColor: Colors.transparent,
// );

// ThemeData darkBlueTheme = ThemeData.dark().copyWith(
//   primaryColor: const Color(0xFF1E1E2C),
//   scaffoldBackgroundColor: const Color(0xFF2D2D44),
//   textTheme: const TextTheme(
//       bodySmall: TextStyle(
//         color: Color(0xFF33E1Ed),
//       ),
//       bodyLarge: TextStyle(
//         color: Colors.black87,
//       ),
//       bodyMedium: TextStyle(
//         color: Colors.black87,
//       )),
// );
