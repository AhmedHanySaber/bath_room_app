
import 'package:bath_room_app/core/network/api_service.dart';
import 'package:bath_room_app/presantion/home/widgets/navigation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'core/colors/colours.dart';
import 'core/controllers/home/home_controller.dart';
import 'core/routing/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await ApiService.init();
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
        ChangeNotifierProvider(create: (context) => HomeController(),lazy: true,)
      ],
      child: MaterialApp(
        title: 'coffee bathroom',
        theme: ThemeData(
          scaffoldBackgroundColor: ConstantsColors.background,
        ),
        onGenerateRoute: Routes.onGenerateRoute,
        home: const NavigationBarConfig(),
      ),
    );
  }
}
