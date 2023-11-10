import 'package:flutter/material.dart';
import 'package:test_flutter/feature/home/presetation/page/home_page.dart';
import 'package:test_flutter/feature/login/presentation/page/login_page.dart';

abstract class Routes {
  static String login = "login";
  static String home = "home";

  static Map<String, Widget Function(BuildContext)> get routes => {
        Routes.login: (context) => const LoginPage(),
        Routes.home: (context) => const HomePage(),
      };
}
