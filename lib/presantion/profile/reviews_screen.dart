import 'package:bath_room_app/core/controllers/reviews/reviews_controller.dart';
import 'package:bath_room_app/models/review_models/review_model.dart';
import 'package:bath_room_app/presantion/profile/widgets/review_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/colors/colours.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Image.asset(
                    "assets/beens.png",
                    height: 150,
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Flexible(
                    child: Text(
                      "APP NAME?",
                      style: TextStyle(
                          fontSize: 40,
                          color: ConstantsColors.navigationColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "My Reviews:",
                    style: TextStyle(
                        fontSize: 25,
                        color: ConstantsColors.navigationColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Consumer<ReviewsController>(
              builder: (context, controller,_) {
                return Expanded(
                  child: ValueListenableBuilder<List<ReviewModel>>(
                      valueListenable: ReviewsController.myReviewsNotifier,
                      builder: (context, listner, _) {
                        print(listner.length);
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: GridView.builder(
                            itemCount: listner.length,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: .68,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return Review(
                                reviewModel: listner[index],
                              );
                            },
                          ),
                        );
                      }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
