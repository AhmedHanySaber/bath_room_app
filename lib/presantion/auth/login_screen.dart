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
                  const CustomButton(),
                  CustomTextField(
                    hintText: 'Enter your text',
                    suffixIcon: null,
                    prefixIcon: null,
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
