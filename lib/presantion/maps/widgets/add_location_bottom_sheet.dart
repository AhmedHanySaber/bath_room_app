import 'package:bath_room_app/core/controllers/location/location_controller.dart';
import 'package:bath_room_app/core/validators/vaildation.dart';
import 'package:bath_room_app/presantion/widgets/custom_button.dart';
import 'package:bath_room_app/presantion/widgets/custoum_text_filed.dart';
import 'package:bath_room_app/presantion/widgets/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../../core/colors/colours.dart';

Future<String?> geo(LatLng latLng) async {
  try {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    Placemark place = placemarks[0];
    String address = '${place.locality}, ${place.country}';
    print(address);
    return address;
  } catch (e) {
    return null;
  }
}

void showAddLocationDetails(BuildContext context, LatLng latLng) {
  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: ConstantsColors.bottomSheetBackGround,
    context: context,
    builder: (context) {
      return AddLocationForm(latLng: latLng);
    },
  );
}

class AddLocationForm extends StatefulWidget {
  final LatLng latLng;

  const AddLocationForm({Key? key, required this.latLng}) : super(key: key);

  @override
  _AddLocationFormState createState() => _AddLocationFormState();
}

class _AddLocationFormState extends State<AddLocationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _desController = TextEditingController();
  String _address = '';

  @override
  void initState() {
    super.initState();
    _getAddress();
  }
  Future<void> _getAddress() async {
    final address = await geo(widget.latLng);
    setState(() {
      _address = address ?? 'Address not found';
    });
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.8,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  "Add New Location",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ConstantsColors.navigationColor2),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CustomTextField(
                      controller: _nameController,
                      validator: validateName,
                      prefixIcon: Icons.add_business_rounded),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: ConstantsColors.navigationColor, width: 2
                      ),
                        color: ConstantsColors.navigationColor2,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child:  Center(
                      child: Text(
                        _address,
                        style: TextStyle(
                          color: ConstantsColors.bottomSheetBackGround,
                          fontSize: 16,
                          fontWeight:FontWeight.w700 ,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CustomTextField(
                      maxLines: 2,
                      controller: _desController,
                      prefixIcon: Icons.add_location_alt),
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
                      child: CoffeeTypeSelector(),
                    ),
                  ),
                ),
                const SizedBox(height: 100),
                Consumer<LocationController>(
                  builder: (context, controller, _) {
                    return ValueListenableBuilder<Map<String, bool>>(
                      valueListenable: LocationController.boolValuesNotifier,
                      builder: (context, entity, _) {
                        return CustomButton(
                          text: "Add Location",
                          width: size.width * .5,
                          onPressed: () async {
                            final address = await geo(widget.latLng);
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              await controller.addLocation(
                                context,
                                map: {
                                  "name": _nameController.text,
                                  "latitude": widget.latLng.latitude,
                                  "longitude": widget.latLng.longitude,
                                  "location_description": address,
                                  "description": _desController.text,
                                  "instant_coffee":
                                      controller.instantCoffeeSelected,
                                  "ground_coffee":
                                      controller.groundCoffeeSelected,
                                  "alternative_options":
                                      controller.alternativeOptionsSelected,
                                  "key_required": controller.keyRequired,
                                  "is_free": controller.isFree,
                                  "wheelchair_friendly":
                                      controller.wheelchairFriendly,
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
                              print("done");
                              controller.reset();
                            }
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CoffeeTypeSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LocationController>(
      builder: (context, controller, _) {
        return Column(
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
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          "Instant coffee",
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
                        const SizedBox(width: 5),
                        Text(
                          "Ground coffee",
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
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            controller.handleKeyRequiredSelected(
                                !controller.keyRequired);
                          },
                          child: Icon(
                            controller.keyRequired
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            color: ConstantsColors.bottomSheetBackGround,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "Key required",
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
                            controller.handleIsFreeSelected(!controller.isFree);
                          },
                          child: Icon(
                            controller.isFree
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            color: ConstantsColors.bottomSheetBackGround,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "Is free",
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
                            controller.handleWheelChairFriendlySelected(
                                !controller.wheelchairFriendly);
                          },
                          child: Icon(
                            controller.wheelchairFriendly
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            color: ConstantsColors.bottomSheetBackGround,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "Wheelchair friendly",
                          style: TextStyle(
                              color: ConstantsColors.bottomSheetBackGround,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 10),
            Text(
              "Rating:",
              style: TextStyle(
                  color: ConstantsColors.bottomSheetBackGround,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            AddRatingIndex(
              index: controller.priceRating,
              onChanged: (value) {
                controller.priceRating = value;
              },
              title: "Price:",
              color: ConstantsColors.bottomSheetBackGround,
            ),
            AddRatingIndex(
              index: controller.tasteRating,
              onChanged: (value) {
                controller.tasteRating = value;
              },
              title: "Taste:",
              color: ConstantsColors.bottomSheetBackGround,
            ),
            AddRatingIndex(
              index: controller.selectionRating,
              onChanged: (value) {
                controller.selectionRating = value;
              },
              title: "Selection:",
              color: ConstantsColors.bottomSheetBackGround,
            ),
            AddRatingIndex(
              index: controller.friendlinessRating,
              onChanged: (value) {
                controller.friendlinessRating = value;
              },
              title: "Friendliness:",
              color: ConstantsColors.bottomSheetBackGround,
            ),
            AddRatingIndex(
              index: controller.priceRating,
              onChanged: (value) {
                controller.cleanlinessRating = value;
              },
              title: "Cleanliness:",
              color: ConstantsColors.bottomSheetBackGround,
            ),
            AddRatingIndex(
              index: controller.tasteRating,
              onChanged: (value) {
                controller.accessibilityRating = value;
              },
              title: "Accessability :",
              color: ConstantsColors.bottomSheetBackGround,
            ),
            AddRatingIndex(
              index: controller.selectionRating,
              onChanged: (value) {
                controller.suppliesRating = value;
              },
              title: "Supplies :",
              color: ConstantsColors.bottomSheetBackGround,
            ),
            AddRatingIndex(
              index: controller.friendlinessRating,
              onChanged: (value) {
                controller.safetyRating = value;
              },
              title: "safty :",
              color: ConstantsColors.bottomSheetBackGround,
            ),
          ],
        );
      },
    );
  }
}
