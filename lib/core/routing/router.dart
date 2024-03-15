import 'package:bath_room_app/presantion/home/widgets/navigation.dart';
import 'package:bath_room_app/presantion/profile/reviews_screen.dart';
import 'package:flutter/material.dart';

import '../../presantion/auth/login_screen.dart';

class Routes {
  static const createAccount = '/create-account';
  static const login = '/login';
  static const create = '/create';
  static const home = '/home';
  static const reviews = '/reviews';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

        case create:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case home:
        return MaterialPageRoute(builder: (_) => const NavigationBarConfig());

      case reviews:
        return MaterialPageRoute(builder: (_) => const ReviewsScreen());

      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}
