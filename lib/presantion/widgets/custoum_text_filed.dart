import 'package:bath_room_app/core/colors/colours.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool obscure;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final bool? readOnly;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.validator,
    this.controller,
    this.obscure = false,
    this.onChanged,
    required this.prefixIcon,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double iconSize = screenWidth * 0.07;

    return SizedBox(
      width: screenWidth * .9,
      child: TextFormField(
        validator: validator,
        controller: controller,
        obscureText: obscure,
        onTap: onTap,
        onChanged: onChanged,
        style: const TextStyle(color: Colors.white,fontSize: 20),
        decoration: InputDecoration(
          filled: true,
          fillColor: ConstantsColors.navigationColor2,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white, fontSize: 20),
          suffixIcon: Icon(suffixIcon, size: iconSize, color: Colors.white),
          prefixIcon: Icon(prefixIcon, size: iconSize, color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                BorderSide(color: ConstantsColors.navigationColor, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                BorderSide(color: ConstantsColors.navigationColor, width: 2),
          ),
          focusColor: ConstantsColors.navigationColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                BorderSide(color: ConstantsColors.navigationColor, width: 1),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                BorderSide(color: ConstantsColors.navigationColor, width: 1),
          ),
        ),
      ),
    );
  }
}
