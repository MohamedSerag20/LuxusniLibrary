import 'package:flutter/material.dart';
import 'package:my_library/lists.dart';

void main() {
  runApp(const MyApp());
}

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 206, 130, 22));

var kDarkColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 9, 41, 5),
    brightness: Brightness.dark);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Library',
      //Light Theme
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.primaryContainer,
            foregroundColor: kColorScheme.primary),
        cardTheme: const CardTheme().copyWith(
            color: kColorScheme.onSecondary,
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            elevation: 15),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: kColorScheme.primaryContainer)),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                backgroundColor: kColorScheme.primaryContainer)),
      ),
      //Dark Theme
      darkTheme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: kDarkColorScheme,
          textTheme: const TextTheme().copyWith(
              titleMedium: TextStyle(color: kDarkColorScheme.primary)),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  backgroundColor: kDarkColorScheme.primaryContainer))),
      home: const Lists(),
      themeMode: ThemeMode.dark,
    );
  }
}
