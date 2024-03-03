import 'package:bath_room_app/constants/colours/colours.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custoum_text_filed.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Custom TextField Example'),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CustomButton(),
                  CustomTextField(
                    fillColor: textfilledColor,
                    hintText: 'Enter your text',
                    icon: Icons.person,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
