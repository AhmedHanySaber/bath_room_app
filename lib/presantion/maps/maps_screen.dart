import 'dart:async';
import 'package:bath_room_app/core/controllers/location/location_controller.dart';
import 'package:bath_room_app/core/network/app_constants.dart';
import 'package:bath_room_app/presantion/maps/add_to_map_screen.dart';
import 'package:bath_room_app/presantion/maps/widgets/location_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../core/validators/bitmap_asset.dart';
import '../../models/locations_model/location_model.dart';

class MapsScreen extends StatefulWidget {
  final List<LocationModel> locations;
  final LocationModel? locationModel;
  final CameraPosition? cameraPosition;

  const MapsScreen({
    super.key,
    required this.locations,
    this.locationModel,
    this.cameraPosition,
  });

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  BitmapDescriptor? cafeIcon;
  BitmapDescriptor? bathroomIcon;
  BitmapDescriptor? bothIcon;
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(-32.2223, 28.888),
    zoom: 15.4746,
  );

  @override
  void initState() {
    super.initState();
    _getImageMarker();
  }

  Future<void> _getImageMarker() async {
    cafeIcon = await _createBitmapDescriptor(AppConstants.image2);
    bathroomIcon = await _createBitmapDescriptor(AppConstants.image1);
    bothIcon = await _createBitmapDescriptor(AppConstants.image3);
    setState(() {});
  }

  Future<BitmapDescriptor> _createBitmapDescriptor(String path) async {
    return BitmapDescriptor.fromBytes(await getBytesFromAsset(path, 160));
  }

  @override
  Widget build(BuildContext context) {
    final markers = _createMarkers(widget.locations);

    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Consumer<LocationController>(
              builder: (context, controller, _) {
                return GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: _kGooglePlex,
                  markers: markers,
                  onMapCreated: (controller) => _controller.complete(controller),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Set<Marker> _createMarkers(List<LocationModel> locations) {
    return locations.map((location) {
      final icon = _getMarkerIcon(location);
      return Marker(
        markerId: MarkerId(location.id ?? "default_id"),
        position: LatLng(location.latitude ?? 0.0, location.longitude ?? 0.0),
        icon: icon ?? BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(
          title: location.name,
          snippet: location.locationDescription,
        ),
        onTap: () => _showLocationDetails(context, location),
      );
    }).toSet();
  }

  BitmapDescriptor? _getMarkerIcon(LocationModel location) {
    if (location.instantCoffee == true && location.keyRequired == true) {
      return bothIcon;
    } else if (location.instantCoffee == true) {
      return cafeIcon;
    } else {
      return bathroomIcon;
    }
  }

  void _showLocationDetails(BuildContext context, LocationModel location) {
    showLocationDetails(
      context,
      location: location,
      isCafe: location.instantCoffee ?? false,
      isBathroom: location.keyRequired ?? false,
    );
  }
}

class InitialMapsScreen extends StatefulWidget {
  final bool addLocation;

  const InitialMapsScreen({super.key, required this.addLocation});

  @override
  State<InitialMapsScreen> createState() => _InitialMapsScreenState();
}

class _InitialMapsScreenState extends State<InitialMapsScreen> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<LocationModel>>(
      valueListenable: LocationController.locationsNotifier,
      builder: (context, locations, _) {
        return widget.addLocation
            ? AddToMapScreen(locations: locations)
            : MapsScreen(locations: locations);
      },
    );
  }
}
