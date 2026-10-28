import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qe_reader/Models/scan_model.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

   final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

    MapType maptype = MapType.normal;

 
  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context)!.settings.arguments as ScanModel;
    final CameraPosition initialPosition =  CameraPosition(
    target: scan.getLatLng(),
    zoom: 18,
  );

  Set<Marker> markers = {};
  markers.add(Marker(
    markerId: const MarkerId('geo-location'),
    position: scan.getLatLng()
    ));

    return  Scaffold(
      appBar: AppBar(
        actions: [IconButton(
          onPressed:() async {
            final GoogleMapController controller = await _controller.future;
            controller.animateCamera(
              CameraUpdate.newCameraPosition(
              CameraPosition( target: scan.getLatLng(), zoom: 18,))
            );
          },
          icon: const Icon(Icons.location_searching_outlined))],
        title:const Text('Mapa',style: TextStyle(color: Colors.white)),),
      body:  GoogleMap(
        mapType: maptype,
        markers: markers,
        initialCameraPosition: initialPosition,
        onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.layers),
        onPressed: (){
          if(maptype == MapType.normal) {
            maptype = MapType.satellite;
          } else {
            maptype = MapType.normal;
          }
          setState(() {});
        })
      
      ,
  
    );

  }
}