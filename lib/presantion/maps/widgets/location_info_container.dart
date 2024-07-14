import 'package:bath_room_app/core/network/app_constants.dart';
import 'package:bath_room_app/models/locations_model/location_model.dart';
import 'package:flutter/material.dart';
import '../../../core/colors/colours.dart';
import '../../widgets/rating_widget.dart';

class LocationInfoContainer extends StatelessWidget {
  final LocationModel locationModel;

  const LocationInfoContainer({super.key, required this.locationModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: locationModel.instantCoffee == false
            ? ConstantsColors.navigationColor2
            : ConstantsColors.fillColor3,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle("Coffee type:", locationModel),
            const SizedBox(height: 5),
            _buildCoffeeTypes(locationModel),
            const SizedBox(height: 10),
            _buildAlternativeOptions(locationModel),
            const SizedBox(height: 10),
            _buildTitle("Rating:", locationModel),
            _buildRatings(locationModel),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String title, LocationModel locationModel) {
    return Text(
      title,
      style: TextStyle(
        color: locationModel.instantCoffee == false
            ? ConstantsColors.bottomSheetBackGround
            : ConstantsColors.navigationColor2,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }

  Widget _buildCoffeeTypes(LocationModel locationModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildCoffeeTypeRow(
          "Instant coffee",
          locationModel.instantCoffee == true,
          locationModel,
        ),
        _buildCoffeeTypeRow(
          "Ground coffee",
          locationModel.instantCoffee == true,
          locationModel,
        ),
      ],
    );
  }

  Widget _buildCoffeeTypeRow(String coffeeType, bool isChecked, LocationModel locationModel) {
    return Row(
      children: [
        Icon(
          isChecked ? Icons.check_box_outlined : Icons.check_box_outline_blank,
          color: locationModel.instantCoffee == false
              ? ConstantsColors.bottomSheetBackGround
              : ConstantsColors.navigationColor2,
        ),
        const SizedBox(width: 5),
        Text(
          coffeeType,
          style: TextStyle(
            color: locationModel.instantCoffee == false
                ? ConstantsColors.bottomSheetBackGround
                : ConstantsColors.navigationColor2,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget _buildAlternativeOptions(LocationModel locationModel) {
    return Row(
      children: [
        Icon(
          locationModel.alternateOptions == true
              ? Icons.check_box_outlined
              : Icons.check_box_outline_blank,
          color: locationModel.instantCoffee == false
              ? ConstantsColors.bottomSheetBackGround
              : ConstantsColors.navigationColor2,
        ),
        const SizedBox(width: 5),
        Text(
          "Alternative options",
          style: TextStyle(
            color: locationModel.instantCoffee == false
                ? ConstantsColors.bottomSheetBackGround
                : ConstantsColors.navigationColor2,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget _buildRatings(LocationModel locationModel) {
    return Padding(
      padding: const EdgeInsets.only(right: 40),
      child: Column(
        children: [
          _buildRatingRow("Price:", locationModel.priceRating!.toDouble(), locationModel),
          const SizedBox(height: 5),
          _buildRatingRow("Taste:", locationModel.tasteRating!.toDouble(), locationModel),
          const SizedBox(height: 5),
          _buildRatingRow("Selection:", locationModel.selectionRating!.toDouble(), locationModel),
          const SizedBox(height: 5),
          _buildRatingRow("Friendliness:", locationModel.friendlinessRating!.toDouble(), locationModel),
        ],
      ),
    );
  }

  Widget _buildRatingRow(String label, double rating, LocationModel locationModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          label,
          style: TextStyle(
            color: locationModel.instantCoffee == false
                ? ConstantsColors.bottomSheetBackGround
                : ConstantsColors.navigationColor2,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 10),
        ...buildRatingImages(
          rating: rating,
          ratingAssetPath: locationModel.instantCoffee == false
              ? AppConstants.image5
              : AppConstants.image4,
          ratingRemainPath: locationModel.instantCoffee == false
              ? AppConstants.image4
              : AppConstants.image5,
        ),
      ],
    );
  }
}
