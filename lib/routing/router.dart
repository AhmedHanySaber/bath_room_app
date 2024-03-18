import 'package:bath_room_app/presantion/Screen/login_screen.dart';
import 'package:fluro/fluro.dart';

import '../presantion/Screen/create_account_screen.dart';
import '../presantion/Screen/home_screen.dart';
import '../presantion/Screen/welcome_screen.dart';

class AppRouter {
  static FluroRouter router = FluroRouter();

  static void setupRouter() {
    router.define(
      '/',
      handler: Handler(handlerFunc: (context, params) => const CreateAccountScreen()),
    );

    // router.define(
    //   '/details',
    //   handler: Handler(handlerFunc: (context, params) => SginUpScreen()),
    // );
  }
}