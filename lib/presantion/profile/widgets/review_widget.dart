import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/colors/colours.dart';

class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ConstantsColors.fillColor3,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Engen Seatle',
                  style: TextStyle(
                      color: ConstantsColors.navigationColor2,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.delete,
                    color: ConstantsColors.navigationColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.check_box_outlined,
                  color: ConstantsColors.navigationColor2,
                ),
                Text(
                  "Instant/Machine",
                  style: TextStyle(color: ConstantsColors.navigationColor2),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.check_box_outlined,
                  color: ConstantsColors.navigationColor2,
                ),
                Text(
                  "Grounds/Beans",
                  style: TextStyle(color: ConstantsColors.navigationColor2),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.money_dollar_circle,
                        color: ConstantsColors.navigationColor,
                      ),
                      const SizedBox(width: 10),
                      Row(
                        children: [
                          Image.asset(
                            "assets/4.png",
                            height: 20,
                          ),
                          Image.asset(
                            "assets/4.png",
                            height: 20,
                          ),
                          Image.asset(
                            "assets/4.png",
                            height: 20,
                          ),
                          Image.asset(
                            "assets/4.png",
                            height: 20,
                          ),
                          Image.asset(
                            "assets/5.png",
                            height: 20,
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.money_dollar_circle,
                        color: ConstantsColors.navigationColor,
                      ),
                      const SizedBox(width: 10),
                      Row(
                        children: [
                          Image.asset(
                            "assets/4.png",
                            height: 20,
                          ),
                          Image.asset(
                            "assets/4.png",
                            height: 20,
                          ),
                          Image.asset(
                            "assets/4.png",
                            height: 20,
                          ),
                          Image.asset(
                            "assets/4.png",
                            height: 20,
                          ),
                          Image.asset(
                            "assets/5.png",
                            height: 20,
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.money_dollar_circle,
                        color: ConstantsColors.navigationColor,
                      ),
                      const SizedBox(width: 10),
                      Row(
                        children: [
                          Image.asset(
                            "assets/4.png",
                            height: 20,
                          ),
                          Image.asset(
                            "assets/4.png",
                            height: 20,
                          ),
                          Image.asset(
                            "assets/4.png",
                            height: 20,
                          ),
                          Image.asset(
                            "assets/4.png",
                            height: 20,
                          ),
                          Image.asset(
                            "assets/5.png",
                            height: 20,
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.money_dollar_circle,
                        color: ConstantsColors.navigationColor,
                      ),
                      const SizedBox(width: 10),
                      Row(
                        children: [
                          Image.asset(
                            "assets/4.png",
                            height: 20,
                          ),
                          Image.asset(
                            "assets/4.png",
                            height: 20,
                          ),
                          Image.asset(
                            "assets/4.png",
                            height: 20,
                          ),
                          Image.asset(
                            "assets/4.png",
                            height: 20,
                          ),
                          Image.asset(
                            "assets/5.png",
                            height: 20,
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: ConstantsColors.navigationColor,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "East London",
                        style:
                            TextStyle(color: ConstantsColors.navigationColor2),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Text(
              "10/12/2023",
              style: TextStyle(color: ConstantsColors.navigationColor2),
            )
          ],
        ),
      ),
    );
  }
}
