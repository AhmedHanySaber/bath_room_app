import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddToMapScreen extends StatefulWidget {
  const AddToMapScreen({super.key});

  @override
  State<AddToMapScreen> createState() => _AddToMapScreenState();
}

class _AddToMapScreenState extends State<AddToMapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-32.2223, 28.888),
    zoom: 12.4746,
  );

  Set<Marker> markers = {
    const Marker(
      markerId: MarkerId('1'),
      position: LatLng(-32.2223, 28.888),
      infoWindow: InfoWindow(title: 'Mark 1'),
    ),
    const Marker(
      markerId: MarkerId('2'),
      position: LatLng(-32.2450, 28.818),
      infoWindow: InfoWindow(title: 'Mark 2'),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.paddingOf(context).bottom),
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        markers: markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
