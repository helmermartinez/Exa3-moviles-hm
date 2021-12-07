import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsGoogle extends StatefulWidget {
  MapsGoogle({Key? key}) : super(key: key);

  @override
  _MapsGoogleState createState() => _MapsGoogleState();
}

class _MapsGoogleState extends State<MapsGoogle> {
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(37.773972, -122.431297), zoom: 11.5);
  late GoogleMapController _googleMapController;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _googleMapController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationButtonEnabled: false,
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: (controller) => _googleMapController = controller,
      ),
    );
  }
}
