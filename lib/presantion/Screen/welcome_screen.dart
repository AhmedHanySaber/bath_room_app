import 'package:flutter/material.dart';

import '../../constants/colours/colours.dart';

String  t1 = "We are ready to help you";
String  t2 = "have a great road-trip.";
String  t3 = "Yes coffee and";
String  t4 = "bathrooms are the key.";
String  t5 = "Coffee keeps you awake";
String  t6 = "and then what goes in";
String  t7 = "must come out...";

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
              'assets/images/logo.png',
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

    Padding(
      padding: const EdgeInsets.fromLTRB(33, 0, 0, 10),
      child: Text(
        'Welcome!',
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(111,66,35, 1.0),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                child: Image.asset('assets/images/dot.png',
                  height: 25,
                  width: 25,
                ),
              ),
              Text(t1,
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(111,66,35, 1.0),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 55),
            child: Text(t2,
              style: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(111,66,35, 1.0),
            )
                ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                child: Image.asset('assets/images/dot.png',
                  height: 25,
                  width: 25,
                ),
              ),
              Text(t3,
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(111,66,35, 1.0),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 55),
            child: Text(t4,
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(111,66,35, 1.0),
                )
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                child: Image.asset('assets/images/dot.png',
                  height: 25,
                  width: 25,
                ),
              ),
              Text(t5,
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(111,66,35, 1.0),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 55),
            child: Text(t6,
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(111,66,35, 1.0),
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 55),
            child: Text(t7,
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(111,66,35, 1.0),
                )
            ),
          ),
        ],
      ),
    ),
    Spacer(),
    Center(
      child: ElevatedButton(
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
          'Sign In',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,

          ),
        ),
      ),
    ),

SizedBox(
  height: 50,
),
    InkWell(
      onTap: () {
        // handel navgiation
      },
      child: Center(
        child: const Text(
          'Skip sign in for now',
          style: TextStyle(
            color:Color.fromRGBO(136, 129, 119, 1.0),
            fontSize: 22,
            fontWeight: FontWeight.bold,

          ),
        ),
      ),
    ),
    Spacer(),
  ],
),
    );
  }
}
