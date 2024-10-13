import 'package:fastlocation/src/modules/history/page/history_page.dart';
import 'package:fastlocation/src/modules/home/page/home_page.dart';
import 'package:fastlocation/src/modules/initial/page/splash.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String history = '/history';

  static Map<String, WidgetBuilder> define() {
    return {
      splash: (context) => SplashScreen(),
      home: (context) => HomePage(),
      history: (context) => HistoryPage(),
    };
  }
}
