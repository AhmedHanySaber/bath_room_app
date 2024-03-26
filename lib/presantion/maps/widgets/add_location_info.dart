import 'package:bath_room_app/core/colors/colours.dart';
import 'package:bath_room_app/core/controllers/location/location_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AddLocationInfoContainer extends StatefulWidget {
  const AddLocationInfoContainer({super.key});

  @override
  State<AddLocationInfoContainer> createState() =>
      _AddLocationInfoContainerState();
}

class _AddLocationInfoContainerState extends State<AddLocationInfoContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ConstantsColors.navigationColor2,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        child: Consumer<LocationController>(
          builder: (context, controller, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Coffee type:",
                  style: TextStyle(
                      color: ConstantsColors.bottomSheetBackGround,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            controller.handleInstantCoffeeSelected(
                                !controller.instantCoffeeSelected);
                          },
                          child: Icon(
                            controller.instantCoffeeSelected
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            color: ConstantsColors.bottomSheetBackGround,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "instant coffee",
                          style: TextStyle(
                              color: ConstantsColors.bottomSheetBackGround,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            controller.handleGroundCoffeeSelected(
                                !controller.groundCoffeeSelected);
                          },
                          child: Icon(
                            controller.groundCoffeeSelected
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            color: ConstantsColors.bottomSheetBackGround,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Ground coffee",
                          style: TextStyle(
                              color: ConstantsColors.bottomSheetBackGround,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.handleAlternativeOptionsSelected(
                            !controller.alternativeOptionsSelected);
                      },
                      child: Icon(
                        controller.alternativeOptionsSelected
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        color: ConstantsColors.bottomSheetBackGround,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "Alternative options",
                      style: TextStyle(
                          color: ConstantsColors.bottomSheetBackGround,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
