import 'package:bath_room_app/constants/colours/colours.dart';
import 'package:flutter/material.dart';

import '../../widgets/custoum_text_filed.dart';



class EnterVerificationCodeScree extends StatelessWidget {
  const EnterVerificationCodeScree({super.key});

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
                            'Password',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(111,66,35, 1.0),
                            ),
                          ),
                          Text(
                            'Reset',
                            style: TextStyle(
                              fontSize: 40,
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

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:13,),
                          child: Text('Enter verification code',
                            style: TextStyle(
                                color: stokredColor,
                                fontSize: 22,
                                fontWeight: FontWeight.w700),),
                        ),
                        SizedBox(
                          height: 5,
                        ),

                        CustomTextField(
                          fillColor: textfilledColor,
                          icon: Icons.email_outlined,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 60,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      fixedSize: const Size(240, 60),
                      foregroundColor: textfilledColor,
                      backgroundColor: buttonColor1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    child: const Text(
                      'Send email',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
