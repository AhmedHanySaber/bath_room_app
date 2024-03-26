import 'package:bath_room_app/core/controllers/location/location_controller.dart';
import 'package:bath_room_app/presantion/maps/widgets/add_location_info.dart';
import 'package:bath_room_app/presantion/widgets/custom_button.dart';
import 'package:bath_room_app/presantion/widgets/custoum_text_filed.dart';
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
  Size size = MediaQuery.of(context).size;
  TextEditingController nameController = TextEditingController();
  TextEditingController desController = TextEditingController();
  showModalBottomSheet(
    scrollControlDisabledMaxHeightRatio: .8,
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
                      controller: nameController,
                      prefixIcon: Icons.add_business_rounded),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CustomTextField(
                      maxLines: 2,
                      controller: desController,
                      prefixIcon: Icons.add_location_alt),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: AddLocationInfoContainer(),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: ConstantsColors.navigationColor2,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          "long: ${latLng.longitude}".substring(0, 12),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: ConstantsColors.fillColor3),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: ConstantsColors.navigationColor2,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          "lat: ${latLng.latitude}".substring(0, 11),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: ConstantsColors.fillColor3),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * .12),
                Consumer<LocationController>(
                  builder: (context, controller, _) {
                    return ValueListenableBuilder<Map<String, bool>>(
                        valueListenable: LocationController.boolValuesNotifier,
                        builder: (context, entity, _) {
                          // print(entity["instant_coffee"] ?? false);
                          // print(entity["ground_coffee"] ?? false);
                          // print(entity["alternative_options"] ?? false);
                          return CustomButton(
                            text: "Add Location",
                            width: size.width * .5,
                            onPressed: () async {
                              final address =await geo(latLng);
                              print(address);
                              await controller.addLocation(
                                context,
                                map: {
                                  "name": nameController.text,
                                  "latitude": latLng.latitude,
                                  "longitude": latLng.longitude,
                                  "location_description": address,
                                  "description": desController.text,
                                  "instant_coffee":
                                  entity["instant_coffee"] ?? false,
                                  "ground_coffee":
                                  entity["ground_coffee"] ?? false,
                                  "alternate_options":
                                  entity["alternative_options"] ?? false,
                                },
                              );
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
