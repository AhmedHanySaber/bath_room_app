import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:bath_room_app/core/colors/colours.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  return widgets;
}
class AddRatingIndex extends StatelessWidget {
  final double index;
  final String title;
  Color? color = ConstantsColors.navigationColor;
  final void Function(double rating) onChanged;

  AddRatingIndex({
    super.key,
    required this.index,
    required this.onChanged,
    required this.title,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                color: color, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          AnimatedRatingStars(
            initialRating: 1.0,
            minRating: 0.0,
            maxRating: 5.0,
            filledColor: ConstantsColors.navigationColor,
            emptyColor: ConstantsColors.fillColor3,
            filledIcon: FontAwesomeIcons.mugSaucer,
            emptyIcon: FontAwesomeIcons.mugSaucer,
            onChanged: onChanged,
            displayRatingValue: true,
            interactiveTooltips: true,
            customFilledIcon: FontAwesomeIcons.mugSaucer,
            customEmptyIcon: FontAwesomeIcons.mugSaucer,
            customHalfFilledIcon: FontAwesomeIcons.mugSaucer,
            starSize: 18,
            animationDuration: const Duration(milliseconds: 300),
            animationCurve: Curves.bounceIn,
            readOnly: false,
          ),
        ],
      ),
    );
  }
}
class AddRatingIndex2 extends StatelessWidget {
  final double index;
  final String title;
  Color? color = ConstantsColors.navigationColor;
  final void Function(double rating) onChanged;

  AddRatingIndex2({
    super.key,
    required this.index,
    required this.onChanged,
    required this.title,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                color: color, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          AnimatedRatingStars(
            initialRating: 1.0,
            minRating: 0.0,
            maxRating: 5.0,
            filledColor: ConstantsColors.navigationColor,
            emptyColor: ConstantsColors.bottomSheetBackGround,
            filledIcon: FontAwesomeIcons.house,
            emptyIcon: FontAwesomeIcons.house,
            onChanged: onChanged,
            displayRatingValue: true,
            interactiveTooltips: true,
            customFilledIcon: FontAwesomeIcons.house,
            customEmptyIcon: FontAwesomeIcons.house,
            customHalfFilledIcon: FontAwesomeIcons.house,
            starSize: 18,
            animationDuration: const Duration(milliseconds: 300),
            animationCurve: Curves.bounceIn,
            readOnly: false,
          ),
        ],
      ),
    );
  }
}
