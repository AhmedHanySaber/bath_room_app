import 'package:bath_room_app/core/colors/colours.dart';
import 'package:bath_room_app/core/routing/router.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _isLoading = false;

  void _skipSignIn() async {
    setState(() {
      _isLoading = true;
    });

    // Simulate a delay for the loading indicator. Replace this with any actual async operation.
    await Future.delayed(const Duration(seconds: 2));

    // Navigate to the home screen.
    Navigator.pushReplacementNamed(context, Routes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 80,
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Image(
                  image: AssetImage(
                    'assets/beens.png',
                  ),
                  height: 160,
                  width: 120,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Text(
                    'Bean',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(111, 66, 35, 1.0),
                    ),
                  ),
                  Text(
                    'Break',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(111, 66, 35, 1.0),
                    ),
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(33, 0, 0, 10),
            child: Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: ConstantsColors.navigationColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                      child: Image.asset(
                        'assets/dot.png',
                        height: 25,
                        width: 25,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        "We are ready to help you have a great road-trip.",
                        style: TextStyle(
                          fontSize: 20,
                          color: ConstantsColors.navigationColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                      child: Image.asset(
                        'assets/dot.png',
                        height: 25,
                        width: 25,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        "Yes coffee and bathrooms are the key.",
                        style: TextStyle(
                          fontSize: 20,
                          color: ConstantsColors.navigationColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                      child: Image.asset(
                        'assets/dot.png',
                        height: 25,
                        width: 25,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        "Coffee keeps you awake and then what goes in must come out...",
                        style: TextStyle(
                          fontSize: 20,
                          color: ConstantsColors.navigationColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.login);
              },
              style: ElevatedButton.styleFrom(
                elevation: 10,
                fixedSize: const Size(230, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              child: Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 22,
                  color: ConstantsColors.navigationColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
          GestureDetector(
            onTap: _skipSignIn,
            child: Center(
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : const Text(
                'Skip sign in for now',
                style: TextStyle(
                  color: Color.fromRGBO(136, 129, 119, 1.0),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
