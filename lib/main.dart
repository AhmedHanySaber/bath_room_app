import 'package:bath_room_app/constants/colours/colours.dart';
import 'package:bath_room_app/routing/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: background,
      ),
      initialRoute: '/',
      onGenerateRoute: AppRouter.router.generator,
    );
  }

  @override
  void initState() {
    super.initState();
    AppRouter.setupRouter();
  }
}
