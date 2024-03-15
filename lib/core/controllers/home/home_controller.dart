import 'package:bath_room_app/presantion/home/home_screen.dart';
import 'package:bath_room_app/presantion/maps/add_to_map_screen.dart';
import 'package:bath_room_app/presantion/maps/maps_screen.dart';
import 'package:bath_room_app/presantion/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  int currentIndex = 0;

  final List<Widget> screens = const [
    HomeScreen(),
    MapsScreen(),
    ProfileScreen(),
    AddToMapScreen(),
  ];

  void changeNavigation(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
