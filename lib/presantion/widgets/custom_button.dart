import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final void Function()? onPressed;

  const CustomButton({super.key, this.onPressed, this.width = 100});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: width,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
            disabledForegroundColor: Colors.grey.withOpacity(0.38),
            disabledBackgroundColor: Colors.grey.withOpacity(0.12),
          ),
          child: const Text('Custom Button')),
    );
  }
}
