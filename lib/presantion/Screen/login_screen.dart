import 'package:bath_room_app/constants/colours/colours.dart';
import 'package:flutter/material.dart';

import '../widgets/custoum_text_filed.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  const Row(
                    children: [
                      Image(
                        image: AssetImage(
                          'assets/images/logo.png',
                        ),
                        height: 160,
                        width: 120,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            'App',
                            style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(111,66,35, 1.0),
                            ),
                          ),
                          Text(
                            'Name',
                            style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(111,66,35, 1.0),
                            ),
                          )
                        ],
                          ),
                    ],
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  CustomTextField(
                    fillColor: textfilledColor,
                    icon: Icons.email_outlined,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    fillColor: textfilledColor,
                    icon: Icons.lock_outline,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forget Password?',
                        style: TextStyle(
                            color: stokredColor,
                            fontSize: 19,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      fixedSize: const Size(220, 60),
                      foregroundColor: textfilledColor,
                      backgroundColor: buttonColor1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      fixedSize: const Size(230, 60),
                      foregroundColor: textfilledColor,
                      backgroundColor: buttonColor1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    child: const Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
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
