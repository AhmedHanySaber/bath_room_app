import 'package:bath_room_app/core/colors/colours.dart';
import 'package:bath_room_app/core/network/app_constants.dart';
import 'package:bath_room_app/models/locations_model/location_model.dart';
import 'package:bath_room_app/presantion/widgets/rating_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoffeeContainer extends StatelessWidget {
  final LocationModel locationModel;

  const CoffeeContainer({super.key, required this.locationModel});

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
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  AppConstants.image3,
                  height: size.width * .19,
                ),
                const SizedBox(width: 12),
                Column(
                  children: [
                    Row(
                      children: [
                        ...buildRatingImages(
                          rating: locationModel.priceRating!.toDouble(),
                          ratingAssetPath: AppConstants.image7,
                          ratingRemainPath: AppConstants.image6,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        ...buildRatingImages(
                          rating: locationModel.friendlinessRating!.toDouble(),
                          ratingAssetPath: AppConstants.image5,
                          ratingRemainPath: AppConstants.image4,
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
                  locationModel.locationDescription??"",
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
