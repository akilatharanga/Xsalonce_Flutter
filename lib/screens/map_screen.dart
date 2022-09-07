import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  static const LatLng defaultLocation = LatLng(5.949401,80.543284);
  static const LatLng destination = LatLng(5.9496, 80.5469);

  Set<Marker> _markers = {};

  // void _onMapCreated(GoogleMapController controller){
  //   setState(() {
  //     _markers.add(
  //       Marker(markerId: MarkerId('id-1'),
  //       position: LatLng(7.084,80.0098),
  //         infoWindow: InfoWindow(
  //           title: 'Salon Chathu',
  //         ),
  //       ),
  //       Marker(markerId: MarkerId('id-1'),
  //         position: LatLng(6.9271,79.8612),
  //         infoWindow: InfoWindow(
  //           title: 'Salon Chathu',
  //         ),
  //       ),
  //       Marker(markerId: MarkerId('id-1'),
  //         position: LatLng(),
  //         infoWindow: InfoWindow(
  //           title: 'Salon Chathu',
  //         ),
  //       ),
  //     );
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: defaultLocation,
            zoom: 10,

          ),
          markers: {
            Marker(markerId: MarkerId('id-1'),
              position: LatLng(7.084,80.0098),
              infoWindow: InfoWindow(
                title: 'Salon Chathu',
              ),
            ),
            Marker(markerId: MarkerId('id-1'),
              position: LatLng(6.9271,79.8612),
              infoWindow: InfoWindow(
                title: 'hair with flair',
              ),
            ),
            Marker(markerId: MarkerId('id-1'),
              position: LatLng(5.949401,80.543284),
              infoWindow: InfoWindow(
                title: 'Salon Chathu',
              ),
            ),
            Marker(markerId: MarkerId('id-1'),
              position: LatLng(7.2303,80.0165),
              infoWindow: InfoWindow(
                title: 'Salon Opal',
              ),
            ),
          },
        ),
      ),
    );
  }
}
