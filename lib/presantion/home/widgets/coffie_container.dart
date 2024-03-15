import 'package:bath_room_app/core/colors/colours.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoffeeContainer extends StatelessWidget {
  const CoffeeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .55,
      decoration: BoxDecoration(
        color: ConstantsColors.backgroundColor3,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/3.png",
                  height: 80,
                ),
                const SizedBox(width: 15),
                Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/7.png",
                          height: 20,
                        ),
                        Image.asset(
                          "assets/7.png",
                          height: 20,
                        ),
                        Image.asset(
                          "assets/7.png",
                          height: 20,
                        ),
                        Image.asset(
                          "assets/7.png",
                          height: 20,
                        ),
                        Image.asset(
                          "assets/6.png",
                          height: 20,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Image.asset(
                          "assets/5.png",
                          height: 20,
                        ),
                        Image.asset(
                          "assets/5.png",
                          height: 20,
                        ),
                        Image.asset(
                          "assets/5.png",
                          height: 20,
                        ),
                        Image.asset(
                          "assets/5.png",
                          height: 20,
                        ),
                        Image.asset(
                          "assets/4.png",
                          height: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  CupertinoIcons.placemark,
                  color: Colors.white,
                ),
                Text(
                  "N2, Gonubie, East London",
                  style: TextStyle(
                      fontSize: 12,
                      color: ConstantsColors.navigationColor2,
                      fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
