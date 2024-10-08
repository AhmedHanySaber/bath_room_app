import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:bath_room_app/core/controllers/auth/auth_controller.dart';
import 'package:bath_room_app/core/controllers/location/location_controller.dart';
import 'package:bath_room_app/core/controllers/reviews/reviews_controller.dart';
import 'package:bath_room_app/core/network/app_constants.dart';
import 'package:bath_room_app/presantion/auth/onboarding.dart';
import 'package:bath_room_app/presantion/home/widgets/navigation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'core/colors/colours.dart';
import 'core/controllers/home/home_controller.dart';
import 'core/network/local/cache_helper.dart';
import 'core/routing/router.dart';
import 'di_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await di.init();
  AppConstants.token = di.sl<CacheHelper>().getData(key: "token") ?? "";
  AppConstants.userId = di.sl<CacheHelper>().getData(key: "userId") ?? "";
  AppConstants.email = di.sl<CacheHelper>().getData(key: "email") ?? "";
  AppConstants.name = di.sl<CacheHelper>().getData(key: "name") ?? "";
  print("token is:${AppConstants.token}");
  print("email is:${AppConstants.email}");
  print("id is:${AppConstants.userId}");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => di.sl<HomeController>(),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (context) => di.sl<AuthController>(),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (context) => di.sl<LocationController>(),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              di.sl<ReviewsController>()..getMyReviews(context),
          lazy: true,
        ),
      ],
      child: MaterialApp(
        title: 'Bean Break',
        theme: ThemeData(
          scaffoldBackgroundColor: ConstantsColors.background,
        ),
        onGenerateRoute: Routes.onGenerateRoute,
        home: AnimatedSplashScreen(
          backgroundColor: ConstantsColors.background,
          splashIconSize: 200,
          splash: Column(
            children: [
              Image.asset(
                'assets/beens.png',
                height: 100,
              ),
              const SizedBox(height: 10),
              Text(
                "BeanBreak",
                style: TextStyle(
                  fontSize: 40,
                  color: ConstantsColors.navigationColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          nextScreen: AppConstants.token != ""
              ? const NavigationBarConfig()
              : const WelcomeScreen(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.fade,
          duration: 3000,
        ),
      ),
    );
  }
}
