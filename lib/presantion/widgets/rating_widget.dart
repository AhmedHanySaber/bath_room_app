import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:bath_room_app/core/colors/colours.dart';
import 'package:flutter/material.dart';

List<Widget> buildRatingImages(
    {required double rating,
    required String ratingAssetPath,
    required String ratingRemainPath}) {
  List<Widget> widgets = [];
  int ratingStars = rating.floor();
  int totalStars = 5;
  int remain = totalStars - ratingStars;

  // Add full star images
  for (int i = 0; i < ratingStars; i++) {
    widgets.add(Image.asset(ratingAssetPath, height: 20));
  }

  for (int i = 0; i < remain; i++) {
    widgets.add(Image.asset(ratingRemainPath, height: 20));
  }

  // int emptyStars = totalStars - fullStars - (hasHalfStar ? 1 : 0);
  // for (int i = 0; i < emptyStars; i++) {
  //   widgets.add(Image.asset("assets/empty_star.png", height: 20)); // Replace with your empty star asset
  // }

  return widgets;
}

class AddRatingIndex extends StatelessWidget {
  final double index;
  final String title;
  final void Function(double rating) onChanged;

  const AddRatingIndex({
    super.key,
    required this.index,
    required this.onChanged,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              color: ConstantsColors.navigationColor,
              fontWeight: FontWeight.bold,
              fontSize: 15),
        ),
        AnimatedRatingStars(
          initialRating: 3.0,
          minRating: 0.0,
          maxRating: 5.0,
          filledColor: ConstantsColors.navigationColor,
          emptyColor: Colors.grey,
          filledIcon: Icons.star,
          halfFilledIcon: Icons.star_half,
          emptyIcon: Icons.star_border,
          onChanged: onChanged,
          displayRatingValue: true,
          interactiveTooltips: true,
          customFilledIcon: Icons.star,
          customHalfFilledIcon: Icons.star_half,
          customEmptyIcon: Icons.star_border,
          starSize: 20,
          animationDuration: const Duration(milliseconds: 300),
          animationCurve: Curves.easeInOut,
          readOnly: false,
        ),
      ],
    );
  }
}
