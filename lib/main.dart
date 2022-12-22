import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';

import 'configs/settings.dart';
import 'configs/themes.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => FluMaterialApp(
      controller: FluAppController(
          appInformations: FluAppInformations(name: 'Flukit gallery'),
          settings: AppSettings(),
          themeBuilder: appThemeBuilders[AppThemes.blue]));
}
