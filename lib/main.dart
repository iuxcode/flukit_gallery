import 'package:flukit/flukit.dart';
import 'package:flukit_gallery/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomeScreen(),
      );
}
