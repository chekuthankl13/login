import 'package:flutter/material.dart';
import 'package:shopdibz/presentation/forgotpsw.dart';
import 'package:shopdibz/presentation/homepage.dart';
import 'package:shopdibz/presentation/login.dart';
import 'package:shopdibz/presentation/siginup.dart';
import 'package:shopdibz/presentation/splashscreen.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case '/signup':
        return MaterialPageRoute(
          builder: (context) => SiginupPage(),
        );

      case '/login':
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );

      case '/forgot':
        return MaterialPageRoute(
          builder: (context) => ForgotPassword(),
        );
      case '/splash':
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );
      default:
        return MaterialPageRoute(builder: (context) => LoginPage());
    }
  }
}
