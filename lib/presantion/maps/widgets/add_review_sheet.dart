import 'package:bath_room_app/core/controllers/reviews/reviews_controller.dart';
import 'package:bath_room_app/core/network/app_constants.dart';
import 'package:bath_room_app/models/locations_model/location_model.dart';
import 'package:bath_room_app/presantion/widgets/rating_widget.dart';
import 'package:bath_room_app/presantion/widgets/snak_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/colors/colours.dart';
import '../../widgets/custom_button.dart';

void showAddReviewDetails(BuildContext context, LocationModel locationModel) {
  Size size = MediaQuery.of(context).size;
  showModalBottomSheet(
    scrollControlDisabledMaxHeightRatio: .68,
    backgroundColor: ConstantsColors.bottomSheetBackGround,
    context: context,
    builder: (context) {
      return SizedBox(
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: SingleChildScrollView(
            child: Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    Image.asset(
                      locationModel.instantCoffee == true &&
                              locationModel.alternateOptions == true
                          ? AppConstants.image3
                          : locationModel.instantCoffee == true
                              ? AppConstants.image2
                              : AppConstants.image1,
                      height: 60,
                    ),
                    const SizedBox(width: 20),
                    Text(
                      locationModel.name!,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: ConstantsColors.navigationColor2),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ConstantsColors.navigationColor2,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 18),
                      child: Consumer<ReviewsController>(
                        builder: (context, controller, _) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Coffee type:",
                                style: TextStyle(
                                    color:
                                        ConstantsColors.bottomSheetBackGround,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              controller
                                                  .handleInstantCoffeeSelected(
                                                      !controller
                                                          .instantCoffee);
                                            },
                                            child: Icon(
                                              controller.instantCoffee
                                                  ? Icons.check_box
                                                  : Icons
                                                      .check_box_outline_blank,
                                              color: ConstantsColors
                                                  .bottomSheetBackGround,
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            "instant coffee",
                                            style: TextStyle(
                                                color: ConstantsColors
                                                    .bottomSheetBackGround,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              controller
                                                  .handleGroundCoffeeSelected(
                                                      !controller.groundCoffee);
                                            },
                                            child: Icon(
                                              controller.groundCoffee
                                                  ? Icons.check_box
                                                  : Icons
                                                      .check_box_outline_blank,
                                              color: ConstantsColors
                                                  .bottomSheetBackGround,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Ground coffee",
                                            style: TextStyle(
                                                color: ConstantsColors
                                                    .bottomSheetBackGround,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              controller
                                                  .handleAlternativeOptionsSelected(
                                                      !controller
                                                          .alternativeOptions);
                                            },
                                            child: Icon(
                                              controller.alternativeOptions
                                                  ? Icons.check_box
                                                  : Icons
                                                      .check_box_outline_blank,
                                              color: ConstantsColors
                                                  .bottomSheetBackGround,
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            "Alternative options",
                                            style: TextStyle(
                                                color: ConstantsColors
                                                    .bottomSheetBackGround,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              controller.handSitDownSelected(
                                                  !controller.sitDown);
                                            },
                                            child: Icon(
                                              controller.sitDown
                                                  ? Icons.check_box
                                                  : Icons
                                                      .check_box_outline_blank,
                                              color: ConstantsColors
                                                  .bottomSheetBackGround,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Sit down",
                                            style: TextStyle(
                                                color: ConstantsColors
                                                    .bottomSheetBackGround,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              controller.handleKeySelected(
                                                  !controller.keyRequired);
                                            },
                                            child: Icon(
                                              controller.keyRequired
                                                  ? Icons.check_box
                                                  : Icons
                                                      .check_box_outline_blank,
                                              color: ConstantsColors
                                                  .bottomSheetBackGround,
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            "key required",
                                            style: TextStyle(
                                                color: ConstantsColors
                                                    .bottomSheetBackGround,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              controller
                                                  .handleWheelChairSelected(
                                                      !controller
                                                          .wheelchairFriendly);
                                            },
                                            child: Icon(
                                              controller.wheelchairFriendly
                                                  ? Icons.check_box
                                                  : Icons
                                                      .check_box_outline_blank,
                                              color: ConstantsColors
                                                  .bottomSheetBackGround,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "wheelchair friendly",
                                            style: TextStyle(
                                                color: ConstantsColors
                                                    .bottomSheetBackGround,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    children: [
                      AddRatingIndex(
                        title: "Price: ",
                        index: Provider.of<ReviewsController>(context,
                                listen: false)
                            .priceRating,
                        onChanged: (value) {
                          Provider.of<ReviewsController>(context, listen: false)
                              .priceRating = value;
                        },
                      ),
                      AddRatingIndex(
                        title: "selection: ",
                        index: Provider.of<ReviewsController>(context,
                                listen: false)
                            .selectionRating,
                        onChanged: (value) {
                          Provider.of<ReviewsController>(context, listen: false)
                              .selectionRating = value;
                        },
                      ),
                      AddRatingIndex(
                        title: "taste: ",
                        index: Provider.of<ReviewsController>(context,
                                listen: false)
                            .tasteRating,
                        onChanged: (value) {
                          Provider.of<ReviewsController>(context, listen: false)
                              .tasteRating = value;
                        },
                      ),
                      AddRatingIndex(
                        title: "friendliness: ",
                        index: Provider.of<ReviewsController>(context,
                                listen: false)
                            .friendlinessRating,
                        onChanged: (value) {
                          Provider.of<ReviewsController>(context, listen: false)
                              .friendlinessRating = value;
                        },
                      ),
                      AddRatingIndex(
                        title: "cleanliness: ",
                        index: Provider.of<ReviewsController>(context,
                                listen: false)
                            .cleanlinessRating,
                        onChanged: (value) {
                          Provider.of<ReviewsController>(context, listen: false)
                              .cleanlinessRating = value;
                        },
                      ),
                      AddRatingIndex(
                        title: "accessibility: ",
                        index: Provider.of<ReviewsController>(context,
                                listen: false)
                            .accessibilityRating,
                        onChanged: (value) {
                          Provider.of<ReviewsController>(context, listen: false)
                              .accessibilityRating = value;
                        },
                      ),
                      AddRatingIndex(
                        title: "supplies: ",
                        index: Provider.of<ReviewsController>(context,
                                listen: false)
                            .suppliesRating,
                        onChanged: (value) {
                          Provider.of<ReviewsController>(context, listen: false)
                              .suppliesRating = value;
                        },
                      ),
                      AddRatingIndex(
                        title: "safety: ",
                        index: Provider.of<ReviewsController>(context,
                                listen: false)
                            .safetyRating,
                        onChanged: (value) {
                          Provider.of<ReviewsController>(context, listen: false)
                              .safetyRating = value;
                        },
                      ),
                    ],
                  ),
                ),
                Consumer<ReviewsController>(
                  builder: (context, controller, _) {
                    return ValueListenableBuilder<Map<String, dynamic>>(
                        valueListenable:
                            ReviewsController.reviewsValuesNotifier,
                        builder: (context, entity, _) {
                          return CustomButton(
                            text: "Add Review",
                            width: size.width * .5,
                            onPressed: () async {
                              final res = await controller.addReview(
                                context,
                                map: {
                                  "location_id": locationModel.id,
                                  "instant_coffee":
                                      entity["instant_coffee"] ?? false,
                                  "beans_coffee":
                                      entity["ground_coffee"] ?? false,
                                  "alternate_options":
                                      entity["alternate_options"] ?? false,
                                  "sit_down": entity["sit_down"] ?? false,
                                  "is_free": false,
                                  "key_required":
                                      entity["key_required"] ?? false,
                                  "wheelchair_friendly":
                                      entity["wheelchair_friendly"] ?? false,
                                  "price_rating": controller.priceRating,
                                  "taste_rating": controller.tasteRating,
                                  "selection_rating":
                                      controller.selectionRating,
                                  "friendliness_rating":
                                      controller.friendlinessRating,
                                  "cleanliness_rating":
                                      controller.cleanlinessRating,
                                  "accessibility_rating":
                                      controller.accessibilityRating,
                                  "supplies_rating": controller.suppliesRating,
                                  "safety_rating": controller.safetyRating,
                                },
                              );
                              if (res == true) {
                                Navigator.pop(context);
                                showSnackBar(context,
                                    text: "review added successfully",
                                    color: Colors.green);

                                /// after making a review we must reset every value
                                /// in the controller
                                /// because every variable will be storied with
                                /// the last value in it so we have to reset these values

                                controller.instantCoffee = false;
                                controller.groundCoffee = false;
                                controller.alternativeOptions = false;
                                controller.sitDown = false;
                                controller.keyRequired = false;
                                controller.wheelchairFriendly = false;
                                controller.priceRating = 1.0;
                                controller.tasteRating = 1.0;
                                controller.selectionRating = 1.0;
                                controller.friendlinessRating = 1.0;
                                controller.suppliesRating = 1.0;
                                controller.accessibilityRating = 1.0;
                                controller.cleanlinessRating = 1.0;
                                controller.safetyRating = 1.0;
                              }
                            },
                          );
                        });
                  },
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
