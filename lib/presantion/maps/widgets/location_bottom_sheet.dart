import 'package:bath_room_app/core/controllers/location/location_controller.dart';
import 'package:bath_room_app/core/controllers/reviews/reviews_controller.dart';
import 'package:bath_room_app/core/routing/router.dart';
import 'package:bath_room_app/models/review_models/review_model.dart';
import 'package:bath_room_app/presantion/maps/widgets/add_review_sheet.dart';
import 'package:bath_room_app/presantion/profile/widgets/review_widget.dart';
import 'package:bath_room_app/presantion/widgets/custom_show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      required bool isBathroom,
    }) {
  showModalBottomSheet(
    backgroundColor: isCafe
        ? ConstantsColors.navigationColor2
        : ConstantsColors.bottomSheetBackGround,
    context: context,
    builder: (context) {
      final locationProvider = Provider.of<LocationController>(context);
      final reviewsProvider = Provider.of<ReviewsController>(context);

      reviewsProvider.getLocationReviews(context, locationId: location.id ?? "");

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: SingleChildScrollView(
          child: Wrap(
            children: <Widget>[
              _buildHeader(context, location, isCafe, isBathroom),
              const SizedBox(height: 20),
              _buildDescription(location, isCafe),
              const SizedBox(height: 10),
              const SizedBox(height: 100, child: AdMobBanner()),
              LocationInfoContainer(locationModel: location),
              _buildActionRow(context, locationProvider, location),
              _buildReviewsList(),
            ],
          ),
        ),
      );
    },
  );
}


Widget _buildHeader(BuildContext context, LocationModel location, bool isCafe, bool isBathroom) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Image.asset(
              isCafe && isBathroom
                  ? AppConstants.image3
                  : isCafe
                  ? AppConstants.image2
                  : AppConstants.image1,
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
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      InkWell(
        onTap: () => Navigator.pop(context),
        child: Icon(
          Icons.close,
          size: 30,
          color: isCafe
              ? ConstantsColors.fillColor3
              : ConstantsColors.navigationColor2,
        ),
      ),
    ],
  );
}

Widget _buildDescription(LocationModel location, bool isCafe) {
  return Container(
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
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildActionRow(BuildContext context, LocationController locationProvider, LocationModel location) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () async {
            if (locationProvider.checkFavorite(locationId: location.id ?? "")) {
              await locationProvider.removeFromFavorites(context, locationId: location.id ?? "");
              Navigator.pop(context);

            } else {
              await locationProvider.addToFavorites(context, locationId: location.id ?? "");
              Navigator.pop(context);
            }
          },
          child: Icon(
            locationProvider.checkFavorite(locationId: location.id ?? "")
                ? FontAwesomeIcons.solidBookmark
                : FontAwesomeIcons.bookmark,
            color: location.instantCoffee == false
                ? ConstantsColors.navigationColor2
                : ConstantsColors.fillColor3,
          ),
        ),
        InkWell(
          child: Icon(
            Icons.share,
            color: location.instantCoffee == false
                ? ConstantsColors.navigationColor2
                : ConstantsColors.fillColor3,
          ),
        ),
        InkWell(
          onTap: () {
            if (AppConstants.token.isNotEmpty) {
              showAddReviewDetails(context, location);
            } else {
              showCustomDialog(
                context,
                title: "Unauthorized",
                body: "Please log in to access the add review feature",
                actionName: "Login",
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
  );
}

Widget _buildReviewsList() {
  return ValueListenableBuilder<List<ReviewModel>>(
    valueListenable: ReviewsController.locationReviewsNotifier,
    builder: (context, reviews, _) {
      if (reviews.isEmpty) {
        return const SizedBox();
      }
      return SizedBox(
        height: MediaQuery.of(context).size.height * .35,
        child: ListView.separated(
          itemCount: reviews.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const SizedBox(width: 5),
          itemBuilder: (context, index) => Review(reviewModel: reviews[index]),
        ),
      );
    },
  );
}
