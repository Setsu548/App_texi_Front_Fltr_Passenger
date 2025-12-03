// import 'package:app_texi_passenger/app/widgets/body_text_widget.dart';
// import 'package:app_texi_passenger/app/widgets/card_primary_widget.dart';
// import 'package:app_texi_passenger/app/widgets/info_tile_flat_widget.dart';
import 'package:app_texi_passenger/app/widgets/primary_button_widget.dart';
// import 'package:app_texi_passenger/app/widgets/search_bar_widget.dart';
import 'package:app_texi_passenger/app/widgets/title_text_widget.dart';
import 'package:app_texi_passenger/l10n/l10n_extension.dart';
// import 'package:app_texi_passenger/theme/main_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../services/address_position_lat_lng.dart';

class SelectPickUpView extends HookWidget {
  const SelectPickUpView({super.key});

  @override
  Widget build(BuildContext context) {

    // final tiles = [
    //   {'title': 'Av. Petrolera Sur 1602', 'description': 'Barrio Don Bosco'},
    //   {'title': 'Paseo de ka ReformaAranjuez 222' , 'description': 'Juarez, America'},
    //   {'title': 'Calle Roble 45', 'description': 'Santa Maria la Ribera'},
    // ];

    // final places = [
    //   {'name': 'Cochabamba'},
    //   {'name': 'Quillacollo'},
    //   {'name': 'Sipe Sipe'},
    // ];
    final selectedPosition = useState<LatLng?>(null);
    final initialPosition = useState<LatLng?>(null);

    useEffect(() {
      Future.microtask(() async {
        bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
        if (!serviceEnabled) {
          await Geolocator.openLocationSettings();
          return;
        }

        LocationPermission permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) return;
        }

        if (permission == LocationPermission.deniedForever) {
          await Geolocator.openAppSettings();
          return;
        }

        Position pos = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );

        initialPosition.value = LatLng(pos.latitude, pos.longitude);
      });

      return null; 
    }, []);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(context.intl.titleSelectYourDestination),
        SizedBox(height: 30),
        initialPosition.value != null
        ? SizedBox(
          height: 500,
          child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: initialPosition.value!,
            zoom: 15,
          ),
          onTap: (position) {
            selectedPosition.value = position;
          },
          markers: {
            if (selectedPosition.value != null)
              Marker(
                markerId: const MarkerId("pickup"),
                position: selectedPosition.value!,
              ),
          },
          zoomGesturesEnabled: true,
          scrollGesturesEnabled: true,
          rotateGesturesEnabled: true,
          tiltGesturesEnabled: true,
          gestureRecognizers: {
            Factory<OneSequenceGestureRecognizer>(
              () => EagerGestureRecognizer(),
            ),
          },

          myLocationEnabled: true,
          myLocationButtonEnabled: true,
        )
        )
        : Center(child: CircularProgressIndicator()),
        SizedBox(height: 30),
        // CustomSearchBar(
        //   icon: Icons.send,
        //   iconColor: lightColorScheme.surfaceVariant,
        //   hintText: context.intl.hintEnterYourAddress,
        //   suggestionsBuilder: (context, controller) {
        //     final input = controller.value.text.toLowerCase();
        //     if (input.isEmpty) return [];

        //     final filtered = places.where((place) =>
        //         place['name']!.toLowerCase().contains(input));

        //     return filtered.map((place) {
        //       return ListTile(
        //         title: BodyText(place['name']!),
        //         onTap: () => controller.closeView(place['name']),
        //       );
        //     });
        //   },
        // ),
        // SizedBox(height: 10),
        // CardPrimary(
        //   children: List.generate(tiles.length, (index) {
        //     return Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         InfoTileFlat(
        //           icon: Icons.restore_outlined,
        //           title: tiles[index]['title']!,
        //           description: tiles[index]['description']!,
        //         ),
        //         SizedBox(height: 10,),
        //         if (index != tiles.length - 1) 
        //           Column(
        //             children: [
        //               Divider(
        //               color: lightColorScheme.secondaryContainer,
        //               thickness: 10,
        //               ),
        //               SizedBox(height: 10)
        //             ],
        //           )
        //       ],
        //     );
        //   }),
        // ),
        // SizedBox(height: 20),
        PrimaryButton(
          text: context.intl.btnContinue,
          onPressed: () async {
            if (selectedPosition.value == null){
              final placeName = await getAddressFromLatLng(initialPosition.value!.latitude,initialPosition.value!.longitude);

              Navigator.pop(context, {
                "lat": initialPosition.value!.latitude,
                "lng": initialPosition.value!.longitude,
                "name": placeName,
              });
              
            }else{
              final placeName = await getAddressFromLatLng(selectedPosition.value!.latitude,selectedPosition.value!.longitude);
              Navigator.pop(context, {
                "lat": selectedPosition.value!.latitude,
                "lng": selectedPosition.value!.longitude,
                "name": placeName,
              });
            }
          }
        ),
        SizedBox(height: 30),
      ],
    );
  }
}