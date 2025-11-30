import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MiniMapBox extends StatefulWidget {
  const MiniMapBox({super.key});

  @override
  State<MiniMapBox> createState() => _MiniMapBoxState();
}

class _MiniMapBoxState extends State<MiniMapBox> {
  GoogleMapController? controller;

  final LatLng initialPos = const LatLng(-16.4897, -68.1193);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.black12,
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          GoogleMap(
            onMapCreated: (c) => controller = c,
            initialCameraPosition: CameraPosition(
              target: initialPos,
              zoom: 15,
            ),
            zoomControlsEnabled: false,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
          ),
          Center(
            child: Icon(Icons.location_on, size: 42, color: Colors.redAccent),
          ),
          Positioned(
            bottom: 12,
            right: 12,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black87,
              ),
              child: IconButton(
                icon: const Icon(Icons.my_location, color: Colors.white),
                onPressed: () {
                  controller?.animateCamera(
                    CameraUpdate.newLatLng(initialPos),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
