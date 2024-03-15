import 'dart:async';
import 'package:bath_room_app/presantion/home/widgets/ad_mob_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => MapsScreenState();
}

class MapsScreenState extends State<MapsScreen> {
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
      child: Stack(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            markers: markers,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ),
      ]),
    );
  }
}
