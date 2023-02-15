import 'package:flukit/flukit.dart';
import 'package:flukit/widgets/app.dart';
import 'package:flukit_gallery/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const App());

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) => FluMaterialApp(
        theme: theme,
        darkTheme: darkTheme,
        home: const HomeScreen(),
      );
}

const Color primaryColor =
    Color.fromARGB(255, 113, 6, 235); //Color(0xFF016BFD);
final ThemeData theme = ThemeData(
    colorSchemeSeed: primaryColor,
    brightness: Brightness.light,
    useMaterial3: true);
final ThemeData darkTheme = ThemeData(
    colorSchemeSeed: primaryColor,
    brightness: Brightness.dark,
    useMaterial3: true);
