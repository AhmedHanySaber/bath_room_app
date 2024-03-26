import 'package:bath_room_app/core/controllers/reviews/reviews_controller.dart';
import 'package:bath_room_app/core/routing/router.dart';
import 'package:bath_room_app/models/review_models/review_model.dart';
import 'package:bath_room_app/presantion/maps/widgets/add_review_sheet.dart';
import 'package:bath_room_app/presantion/profile/widgets/review_widget.dart';
import 'package:bath_room_app/presantion/widgets/custom_show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/colors/colours.dart';
import '../../../core/network/app_constants.dart';
import '../../../models/locations_model/location_model.dart';
import '../../home/widgets/ad_mob_container.dart';
import 'location_info_container.dart';

void showLocationDetails(
  BuildContext context, {
  required LocationModel location,
  required bool isCafe,
}) {
  showModalBottomSheet(
    scrollControlDisabledMaxHeightRatio: .8,
    backgroundColor: isCafe
        ? ConstantsColors.navigationColor2
        : ConstantsColors.bottomSheetBackGround,
    context: context,
    builder: (context) {
      Provider.of<ReviewsController>(context).getLocationReviews(
        context,
        locationId: location.id ?? "",
      );
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: SingleChildScrollView(
          child: Wrap(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Image.asset(
                      isCafe ? AppConstants.image2 : AppConstants.image1,
                      height: 60,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      location.name ?? "unknown",
                      style: TextStyle(
                          color: isCafe
                              ? ConstantsColors.bottomSheetBackGround
                              : ConstantsColors.navigationColor2,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: isCafe
                      ? ConstantsColors.fillColor3
                      : ConstantsColors.navigationColor2,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Flexible(
                          child: Text(
                        location.description ?? "",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isCafe
                              ? ConstantsColors.navigationColor2
                              : ConstantsColors.bottomSheetBackGround,
                        ),
                      ))
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 100, child: AdMobBanner()),
              LocationInfoContainer(locationModel: location),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      color: location.instantCoffee == false
                          ? ConstantsColors.navigationColor2
                          : ConstantsColors.fillColor3,
                    ),
                    Icon(
                      Icons.share,
                      color: location.instantCoffee == false
                          ? ConstantsColors.navigationColor2
                          : ConstantsColors.fillColor3,
                    ),
                    InkWell(
                      onTap: () {
                        if (AppConstants.userId != '') {
                          showAddReviewDetails(context, location);
                        } else {
                          showCustomDialog(
                            context,
                            title: "Unauthorized",
                            body:
                                "please login to access add review feature",
                            actionName: "login",
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                Routes.login,
                                (route) => false,
                              );
                            },
                          );
                        }
                      },
                      child: Image.asset(
                        AppConstants.image8,
                        width: 25,
                        color: location.instantCoffee == false
                            ? ConstantsColors.navigationColor2
                            : ConstantsColors.fillColor3,
                      ),
                    ),
                  ],
                ),
              ),
              ValueListenableBuilder<List<ReviewModel>>(
                valueListenable: ReviewsController.locationReviewsNotifier,
                builder: (context, listener, _) {
                  if (listener.isEmpty) {
                    return const SizedBox();
                  }
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * .31,
                    child: ListView.separated(
                      itemCount: listener.length,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 5);
                      },
                      itemBuilder: (context, index) {
                        return Review(
                          reviewModel: listener[index],
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}