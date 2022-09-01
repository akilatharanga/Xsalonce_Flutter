import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  static const LatLng defaultLocation = LatLng(6.9271,79.8612);
  static const LatLng destination = LatLng(5.9496, 80.5469);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: defaultLocation,
            zoom: 14.5,

          ),
          markers: {},
        ),
      ),
    );
  }
}
