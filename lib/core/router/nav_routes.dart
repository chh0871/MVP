import 'package:cherry_mvp/features/products/product_page.dart';
import 'package:flutter/material.dart';
import 'package:cherry_mvp/features/register/registerpage.dart';
import 'package:cherry_mvp/features/home/homepage.dart';
import 'package:cherry_mvp/features/login/loginpage.dart';
import 'package:cherry_mvp/features/welcome/welcome_page.dart';

class AppRoutes {
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgotPassword';
  static const String home = '/home';
  static const String chat = '/chat'; // <- added chat route
  static const String discover = '/discover';
  static const String product = '/product'; // <- added product route

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return MaterialPageRoute(builder: (_) => const WelcomePage());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case register:
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case product:
        // Assuming ProductPage takes a productId as an argument
        final productId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => ProductPage(productId: productId),
        );
      case home:
        return MaterialPageRoute(builder: (_) => HomePage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
