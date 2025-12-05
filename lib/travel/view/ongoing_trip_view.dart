import 'package:app_texi_passenger/app/app_router.dart';
import 'package:app_texi_passenger/app/widgets/body_text_widget.dart';
import 'package:app_texi_passenger/app/widgets/card_tertiary_widget.dart';
import 'package:app_texi_passenger/app/widgets/driver_info_widget.dart';
import 'package:app_texi_passenger/app/widgets/info_tile_flat_secondary_widget.dart';
import 'package:app_texi_passenger/app/widgets/label_text_widget.dart';
import 'package:app_texi_passenger/app/widgets/secondary_button_icon_widget.dart';
import 'package:app_texi_passenger/app/widgets/title_text_widget.dart';
import 'package:app_texi_passenger/l10n/l10n_extension.dart';
import 'package:app_texi_passenger/theme/main_theme.dart';
import 'package:app_texi_passenger/travel/view/simulated_map_box.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../security/bloc/login_bloc.dart';

class OngoingTripView extends HookWidget {
  const OngoingTripView({super.key, required this.issueId});

  final String issueId;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      final sub = FirebaseFirestore.instance
          .collection('drive')
          .doc(issueId)
          .snapshots()
          .listen((snapshot) {
            if (!snapshot.exists) return;

            final status = snapshot.data()?['status']?.toString().trim();

            if (status == 'end_travel') {
              appRouter.push('/travel/travel_rating');
            }
          });
      return sub.cancel;
    }, []);

    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        final startPoint = LatLng(state.latInit!, state.lngInit!);
        final endPoint   = LatLng(state.latFin!, state.lngFin!);
        
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleText(context.intl.titleTripInProgress),
            SizedBox(height: 10),
            BodyText(context.intl.bodyTripDetails),
            SizedBox(height: 10),
            SimulatedRouteMapPage(
              start: startPoint, 
              end: endPoint
            ),
            SizedBox(height: 10),
            InfoTileFlatSecondary(
              icon: Icons.send,
              colorIcon: lightColorScheme.surfaceVariant,
              title: context.intl.labelOrigin,
              description: state.originDescription!,
            ),
            SizedBox(height: 10),
            InfoTileFlatSecondary(
              icon: Icons.flag,
              colorIcon: lightColorScheme.surfaceVariant,
              title: context.intl.labelDestination,
              description: state.destinationDescription!,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelText(context.intl.labelEstimatedDistance),
                    BodyText('${state.distance!} km'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelText(context.intl.labelEstimatedTime),
                    BodyText('${state.originTime!} min'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            CardTertiary(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LabelText(context.intl.labelFare),
                    BodyText('${state.earnings} Bs.', color: lightColorScheme.surfaceVariant),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            DriverInfo(
              personName: "Conductor TEXI",
              vehicleName: "Toyota Corolla - Gris",
              licensePlate: "ABC-123",
              avatarUrl: "assets/images/texi.png",
              rating: 4.8,
            ),
            SizedBox(height: 30),
            SecondaryButtonIcon(
              text: context.intl.btnSafeTrip,
              onPressed: () {
                appRouter.push('/travel/trip_safety');
              },
              icon: Icons.shield_sharp,
            ),
            SizedBox(height: 30),
          ],
        );
      },
    );
  }
}
