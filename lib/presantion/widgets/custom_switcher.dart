import 'package:bath_room_app/core/colors/colours.dart';
import 'package:flutter/material.dart';

class CustomSwitcher extends StatefulWidget {
  final String title;

  const CustomSwitcher({super.key, required this.title});

  @override
  State<CustomSwitcher> createState() => _CustomSwitcherState();
}

class _CustomSwitcherState extends State<CustomSwitcher> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 25,
            color: ConstantsColors.navigationColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Switch(
          value: selected,
          inactiveThumbColor: ConstantsColors.fillColor3,
          inactiveTrackColor: ConstantsColors.navigationColor,
          activeColor:ConstantsColors.navigationColor,
          activeTrackColor: ConstantsColors.fillColor3,
          onChanged: (x) {
            setState(() {
              selected = x;
            });
          },
        )
      ],
    );
  }
}

class CustomRowButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;

  const CustomRowButton({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 25,
            color: ConstantsColors.navigationColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.arrow_forward_ios,
              color: ConstantsColors.navigationColor,
            ),
          ),
        )
      ],
    );
  }
}
