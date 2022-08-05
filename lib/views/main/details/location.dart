import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate_app/utils/theme/app_colors.dart';

class Location extends StatefulWidget {
  const Location({Key? key, required this.address}) : super(key: key);
  final String address;
  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.5167, 36.2833),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(children: [
          Row(
            children: [
              Icon(Icons.location_on_outlined),
              SizedBox(
                width: 5,
              ),
              Text(
                widget.address,
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
         SizedBox(height: 300,
           child: GoogleMap(
             mapType: MapType.hybrid,
             initialCameraPosition: _kGooglePlex,
             onMapCreated: (GoogleMapController controller) {_controller.complete(controller);
             },

           ),),
        ]),
      ),
    );
  }
}
