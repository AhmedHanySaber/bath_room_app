
import 'package:bath_room_app/constants/colours/colours.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Color fillColor;
  final String hintText;
  final IconData icon;

  const CustomTextField({
    Key? key,
    required this.fillColor,
    required this.hintText,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double iconSize = screenWidth * 0.06;

    return Container(
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: stokredColor,
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.02,
          vertical: screenWidth * 0.01,
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: iconSize),
            SizedBox(width: screenWidth * 0.02),
            Container(
              height: screenWidth * 0.09,
              width: 2.0,
              color: stokredColor,
            ),
            SizedBox(width: screenWidth * 0.02),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}