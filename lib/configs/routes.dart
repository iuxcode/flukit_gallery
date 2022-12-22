import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum AppRoutes { splash }

extension on AppRoutes {
  String get name => '/$name';

  Widget get page {
    switch (this) {
      case AppRoutes.splash:
        return FluScreen(body: Center(child: Text(name)));
    }
  }
}

List<FluGetPage> appPages = AppRoutes.values.map((route) {
  Transition? transition;

  /* switch (route) {
    case AppRoutes.splash:
      transition = Transition.rightToLeft;
      break;
  } */

  return FluGetPage(
      name: route.name, page: () => route.page, transition: transition);
}).toList();

/// Pushes a new named page to the stack.
/// if [off] is true, it pop several pages in the stack until [predicate] is true.
void navigateTo(AppRoutes route, {bool off = false}) =>
    off ? Get.offAllNamed(route.name) : Get.toNamed(route.name);
