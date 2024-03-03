import 'package:bath_room_app/constants/colours/colours.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
       body:Center(
         child: Text('Home Screen'),
       ),
    );
  }
}
