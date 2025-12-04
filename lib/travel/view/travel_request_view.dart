import 'dart:math';

import 'package:app_texi_passenger/app/app_router.dart';
import 'package:app_texi_passenger/app/widgets/double_icon_button_widget.dart';
import 'package:app_texi_passenger/app/widgets/icon_text_button_widget.dart';
import 'package:app_texi_passenger/app/widgets/image_info_card_widget.dart';
import 'package:app_texi_passenger/app/widgets/info_tile_widget.dart';
import 'package:app_texi_passenger/app/widgets/label_text_widget.dart';
import 'package:app_texi_passenger/app/widgets/primary_button_widget.dart';
import 'package:app_texi_passenger/app/widgets/title_text_widget.dart';
import 'package:app_texi_passenger/l10n/l10n_extension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../app/widgets/loading_dialog.dart';
import '../../security/bloc/login_bloc.dart';

class TravelRequestView extends HookWidget {
  const TravelRequestView({super.key});

  @override
  Widget build(BuildContext context) {

    final selectedIndex = useState<int?>(null);

    final cards = [
      {'title': 'Economico', 'description': '4 Pasajeros', 'price': '5.50'},
      {'title': 'Confort', 'description': '4 pasajeros', 'price': '7.80'},
      {'title': 'Premium', 'description': '6 pasajeros', 'price': '12.30'},
    ];

    final locations = [
      {'icon': Icons.home_work_outlined, 'label': 'Oficina', 'description': 'Av.Reforma 222'},
      {'icon': Icons.home, 'label': 'Casa', 'description': 'Calle Roble 45'},
      {'icon': Icons.restaurant, 'label': 'Restaurante', 'description': 'Plaza Central'},
      {'icon': Icons.local_hospital, 'label': 'Hospital', 'description': 'Av. Blanco Galindo'},
    ];
    final namePickSelection = useState<String>('');
    final latInit = useState<double?>(null);
    final lngInit = useState<double?>(null);

    final nameDestinationSelection = useState<String>('');
    final latFin = useState<double?>(null);
    final lngFin = useState<double?>(null);
    final amountController = useTextEditingController(text: '');    // tarifa base
    double perKmFare = 3.2;
    double distance=0.0;

    double calculateDistance(double lat1, double lng1, double lat2, double lng2) {
      return Geolocator.distanceBetween(lat1, lng1, lat2, lng2) / 1000; // km
    }

    void calculateFare(double? baseFare) {
      
      if (latInit.value != null && lngInit.value != null &&
          latFin.value != null && lngFin.value != null) {

        distance = calculateDistance(
          latInit.value!, lngInit.value!,
          latFin.value!, lngFin.value!,
        );

        double total = (baseFare ?? 5.50)  + (distance * perKmFare);

        amountController.text = total.toStringAsFixed(2);
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(context.intl.titleRequestTrip),
        SizedBox(height: 20),
        IconTextButton(
        icon: Icons.circle_rounded, 
        label: namePickSelection.value != '' ? namePickSelection.value :'Punto de recojo', 
        onTap: () async {
          PermissionStatus status = await Permission.location.status;
          if (status.isDenied) {
            status = await Permission.location.request();
          }
          if (status.isPermanentlyDenied) {
            await openAppSettings();
            return;
          }
          if (status.isGranted) {
            final result = await appRouter.push('/travel/pick_selection');
            if (result != null) {
              final data = result as Map<String, dynamic>;
              final name = data['name'];
              latInit.value = data['lat'];
              lngInit.value = data['lng'];
              namePickSelection.value = name; 
            }
          }
        },),
        SizedBox(height: 10),
        IconTextButton(icon: Icons.send, 
        label: nameDestinationSelection.value != '' ? nameDestinationSelection.value :context.intl.labelDestination, 
        onTap: () async {
          PermissionStatus status = await Permission.location.status;
          if (status.isDenied) {
            status = await Permission.location.request();
          }
          if (status.isPermanentlyDenied) {
            await openAppSettings();
            return;
          }
          if (status.isGranted) {
            final result = await appRouter.push('/travel/destination_selection');
            if (result != null) {
              final data = result as Map<String, dynamic>;
              final name = data['name'];
              latFin.value = data['lat'];
              lngFin.value = data['lng'];
              nameDestinationSelection.value = name; 
              calculateFare(null);
              selectedIndex.value = 0;
            }
          }
        },),
        SizedBox(height: 10),
        LabelText(context.intl.labelSavedDestinations),
        SizedBox(height: 10),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (var location in locations)
                Padding(
                  padding: EdgeInsets.only(right: 10), 
                  child: InfoTile(
                    icon: location['icon']! as IconData,
                    label: location['label'] as String,
                    description: location['description'] as String,
                    onTap: () {},
                  ),
                ),
            ],
          ),
        ),
        amountController.text != ''
        ? SizedBox(height: 30)
        : Container(),
        amountController.text != ''
        ? TitleText(context.intl.titleSelectYourVehicle)
        : Container(),
        amountController.text != ''
        ? SizedBox(height: 10)
        : Container(),
        amountController.text != ''
        ? SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 10,
              children: List.generate(cards.length, (index) {
                final card = cards[index];
                final isSelected = selectedIndex.value == index;
                return ImageInfoCard(
                  imageUrl: 'assets/images/texi.png',
                  title: card['title']!,
                  description: card['description']!,
                  price: card['price']!,
                  isSelected: isSelected, 
                  onTap: () {
                    selectedIndex.value = index;
                    calculateFare(double.parse(card['price']!));
                  },
                );
              })  ,
            )
          ): Container(),
        amountController.text != ''
        ? SizedBox(height: 20)
        : Container(),
        amountController.text != ''
        ? TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              floatingLabelAlignment: FloatingLabelAlignment.center,
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(
                vertical: 22,
                horizontal: 16,
              ),
            ),
          )
        : Container(),
        SizedBox(height: 20),
        PrimaryButton(
        text: context.intl.btnRequestTaxiNow,
        onPressed: (amountController.text.isNotEmpty &&
                selectedIndex.value != null &&
                latInit.value != null &&
                latFin.value != null)
            ? () async {
                final LatLng randomPos = randomNearbyPoint(latInit.value!, lngInit.value!, 600);
                final ref = await createIssue(
                  namePickSelection.value,
                  latFin.value!,
                  lngFin.value!,
                  nameDestinationSelection.value,
                  latInit.value!,
                  lngInit.value!,
                  randomPos.latitude,
                  randomPos.longitude,
                  'pending',
                  'Juan Perez',
                  1,
                  5.0,
                  double.parse(amountController.text),
                );

                final issueId = ref.id;
                context.read<LoginBloc>().add(LoginEvent.saveRoutes(
                  latInit: latInit.value!, 
                  lngInit: lngInit.value!, 
                  latFin: latFin.value!, 
                  lngFin: lngFin.value!, 
                  currentlat: randomPos.latitude,
                  currentFin: randomPos.longitude,
                  originTime: '5.0',
                  originDescription: namePickSelection.value,
                  destinationDescription: nameDestinationSelection.value,
                  distance: 1,
                  earnings: double.parse(amountController.text)
                ));
                showLoadingDialog(context,message: 'Buscando taxi');
                FirebaseFirestore.instance
                    .collection('drive')
                    .doc(issueId)
                    .snapshots()
                    .listen((snapshot) {
                  if (!snapshot.exists) return;

                  final status = snapshot.data()?['status'];

                  if (status == 'in_comming') {
                    Navigator.of(context).pop(); // Quitar loading
                    appRouter.push('/travel/driver_tracking',extra: issueId);
                  }
                });
                // appRouter.push('/travel/driver_tracking');
              }
            : null,
      ),

        SizedBox(height: 30),
        TitleText(context.intl.titleRequestVehicleFromOperator),
        SizedBox(height: 20),
        DoubleIconButton(
          leadingIcon: Icons.local_taxi,
          title: context.intl.titleCallTexiOperator,
          description: context.intl.descTexiCentral,
          trailingIcon: Icons.call,
          onTap: () {},
        ),
        SizedBox(height: 30),
      ],
    );
  }

  Future<DocumentReference> createIssue(String pasangerEnd,double pasangerEndLat,double pasangerEndLng,
    String pasangerStart,double pasangerStartLat,double pasangerStartLng,double currentRouteLat,double currentRouteLng,String status,String fullName,double distanceKm,
    double timeMin,double amount) async {
        final ref = await FirebaseFirestore.instance.collection('drive').add({
      'current_route_lat':currentRouteLat,
      'current_route_lng':currentRouteLng,
      'pasanger_end': pasangerEnd,
      'pasanger_end_lat': pasangerEndLat,
      'pasanger_end_lng': pasangerEndLng,
      'pasanger_start': pasangerStart,
      'pasanger_start_lat': pasangerStartLat,
      'pasanger_start_lng': pasangerStartLng,
      'status': status,
      'amount': amount,
      'distance_km': distanceKm,
      'time_min': timeMin,
      'full_name': fullName,
    });

    // Guardar el ID dentro del documento
    await ref.update({'id': ref.id});

    return ref;
  }


    LatLng randomNearbyPoint(double lat, double lng, double radiusInMeters) {
      final random = Random();

      double radiusInDegrees = radiusInMeters / 111320.0;

      double u = random.nextDouble();
      double v = random.nextDouble();

      double w = radiusInDegrees * sqrt(u);
      double t = 2 * pi * v;

      double newLat = lat + w * cos(t);
      double newLng = lng + w * sin(t) / cos(lat * pi / 180);

      return LatLng(newLat, newLng);
    }

  
}