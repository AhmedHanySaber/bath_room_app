import 'package:bath_room_app/core/controllers/reviews/reviews_controller.dart';
import 'package:bath_room_app/core/network/app_constants.dart';
import 'package:bath_room_app/models/review_models/review_model.dart';
import 'package:bath_room_app/presantion/widgets/custom_show_dialog.dart';
import 'package:bath_room_app/presantion/widgets/rating_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/colors/colours.dart';

class Review extends StatelessWidget {
  final ReviewModel reviewModel;

  const Review({super.key, required this.reviewModel});

  @override
  Widget build(BuildContext context) {
    final String myId = AppConstants.userId;
    return Container(
      width: MediaQuery.of(context).size.width * .5,
      decoration: BoxDecoration(
        color: ConstantsColors.bottomSheetBackGround,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  reviewModel.userName ?? "",
                  style: TextStyle(
                      color: ConstantsColors.navigationColor2,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                reviewModel.userId == myId
                    ? Consumer<ReviewsController>(
                        builder: (context, controller, _) {
                          return InkWell(
                            onTap: () {
                              showCustomDialog(
                                context,
                                title: "delete",
                                body: "this review will be deleted",
                                onPressed: () {
                                  controller.deleteReview(
                                    context,
                                    locationId: reviewModel.id ?? "",
                                  );
                                },
                                actionName: 'delete',
                              );
                            },
                            child: Icon(
                              Icons.delete,
                              color: ConstantsColors.navigationColor,
                            ),
                          );
                        },
                      )
                    : const SizedBox(),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                reviewModel.instantCoffee!
                    ? Icon(
                        Icons.check_box_outlined,
                        color: ConstantsColors.navigationColor2,
                      )
                    : Icon(
                        Icons.check_box_outline_blank,
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
                reviewModel.beansCoffee!
                    ? Icon(
                        Icons.check_box_outlined,
                        color: ConstantsColors.navigationColor2,
                      )
                    : Icon(
                        Icons.check_box_outline_blank,
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
                          ...buildRatingImages(
                            rating: reviewModel.priceRating!.toDouble(),
                            ratingAssetPath: AppConstants.image4,
                            ratingRemainPath: AppConstants.image5,
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.emoji_food_beverage,
                        color: ConstantsColors.navigationColor,
                      ),
                      const SizedBox(width: 10),
                      Row(
                        children: [
                          ...buildRatingImages(
                            rating: reviewModel.tasteRating!.toDouble(),
                            ratingAssetPath: AppConstants.image4,
                            ratingRemainPath: AppConstants.image5,
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.ads_click,
                        color: ConstantsColors.navigationColor,
                      ),
                      const SizedBox(width: 10),
                      Row(
                        children: [
                          ...buildRatingImages(
                            rating: reviewModel.selectionRating!.toDouble(),
                            ratingAssetPath: AppConstants.image4,
                            ratingRemainPath: AppConstants.image5,
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.clean_hands,
                        color: ConstantsColors.navigationColor,
                      ),
                      const SizedBox(width: 10),
                      Row(
                        children: [
                          ...buildRatingImages(
                            rating: reviewModel.cleanlinessRating!.toDouble(),
                            ratingAssetPath: AppConstants.image4,
                            ratingRemainPath: AppConstants.image5,
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
