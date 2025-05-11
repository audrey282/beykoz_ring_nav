import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  late GoogleMapController mapController;
  final initialCameraPosition = LatLng(41.0985, 29.0921);

  void initstate() {
    super.initState();
    var _= getLocationUpdates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
      GoogleMap(initialCameraPosition:
      CameraPosition(target:
      LatLng (41.015137, 28.979530), zoom:12 ),
      markers: {

        Marker(
          markerId: MarkerId("_currentLocation"),
          icon: BitmapDescriptor.defaultMarker,
          position: LatLng(41.07269901237686, 28.99624488072809),
        ),
        Marker(
          markerId: MarkerId("_sourceLocation"),
          icon: BitmapDescriptor.defaultMarker,
          position: LatLng(41.0958, 29.0921),
        )
      }, 
     ),
    );
  }
  Future<void> getLocationUpdates() async{
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    Location location = Location();
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    LocationData currentLocation = await location.getLocation();
    debugPrint("Current Location: ${currentLocation.latitude}, ${currentLocation.longitude}");
  }
}
