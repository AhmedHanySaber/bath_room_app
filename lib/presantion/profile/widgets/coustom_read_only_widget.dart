import 'package:bath_room_app/core/colors/colours.dart';
import 'package:flutter/material.dart';

class CustomReadOnlyField extends StatelessWidget {
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final String? hintText;
  final String text;
  final void Function()? suffixOnTap;

  const CustomReadOnlyField({
    super.key,
    this.hintText,
    this.suffixIcon,
    required this.prefixIcon,
    required this.text,
    this.suffixOnTap,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double iconSize = screenWidth * 0.07;

    return SizedBox(
      width: screenWidth * .9,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          color: ConstantsColors.navigationColor2,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: ConstantsColors.navigationColor, width: 1),
        ),
        child: Row(
          children: [
            Icon(prefixIcon, size: iconSize, color: Colors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text.isNotEmpty ? text : hintText ?? '',
                style: TextStyle(
                  color: text.isNotEmpty
                      ? Colors.white
                      : Colors.white.withOpacity(.6),
                  fontSize: 20,
                ),
              ),
            ),
            if (suffixIcon != null)
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap: suffixOnTap,
                  child: Icon(suffixIcon, size: iconSize, color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
