import 'package:app_texi_passenger/app/app_router.dart';
import 'package:app_texi_passenger/app/widgets/body_text_widget.dart';
import 'package:app_texi_passenger/app/widgets/driver_rating_tile_widget.dart';
import 'package:app_texi_passenger/app/widgets/dual_text_line_widget.dart';
import 'package:app_texi_passenger/app/widgets/info_tile_flat_secondary_widget.dart';
import 'package:app_texi_passenger/app/widgets/info_tile_flat_widget.dart';
import 'package:app_texi_passenger/app/widgets/label_text_widget.dart';
// import 'package:app_texi_passenger/app/widgets/primary_button_widget.dart';
import 'package:app_texi_passenger/app/widgets/secondary_button_widget.dart';
import 'package:app_texi_passenger/app/widgets/title_text_widget.dart';
import 'package:app_texi_passenger/l10n/l10n_extension.dart';
import 'package:app_texi_passenger/travel/view/simulated_map_box.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../security/bloc/login_bloc.dart';
import '../../theme/main_theme.dart';

class DriverTrackingView extends HookWidget {
  const DriverTrackingView({super.key, required this.issueId});

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

            if (status == 'start_travel') {
              appRouter.push('/travel/ongoing_trip', extra: issueId);
            }
          });
      return sub.cancel;
    }, []);

    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        final startPoint = LatLng(state.currentlat!, state.currentFin!);
        final endPoint   = LatLng(state.latInit!, state.lngInit!);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleText(context.intl.titleRealTimeTracking),
            SizedBox(height: 10),
            LabelText(context.intl.labelDriverOnTheWay),
            SizedBox(height: 20),
            SimulatedRouteMapPage(
              start: startPoint,
              end: endPoint,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: DriverRatingTile(
                    name: 'Ana Martinez',
                    rating: 4.9,
                    avatarImage: NetworkImage(''),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  child: Icon(
                    Icons.chat,
                    size: 30,
                    color: lightColorScheme.onSurface,
                  ),
                  onTap: () {
                    appRouter.push('/travel/passenger_chat');
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            InfoTileFlat(
              icon: Icons.car_crash_outlined,
              colorIcon: lightColorScheme.surfaceVariant,
              title: 'Toyota Corolla - Gris',
              description: 'ABC-123',
            ),
            SizedBox(height: 10),
            LabelText(context.intl.labelEstimatedArrivalTime),
            SizedBox(height: 10),
            DualTextLine(
              leftText: '${state.originTime!} minutos' ,
              rightText: context.intl.rightTextOnTheWay,
            ),
            SizedBox(height: 10),
            BodyText(context.intl.bodyTripDetails),
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
              description: state.destinationDescription!
            ),
            // SizedBox(height: 30),
            // PrimaryButton(
            //   text: context.intl.btnNext,
            //   onPressed: () {
            //     appRouter.push('/travel/ongoing_trip');
            //   },
            // ),
            SizedBox(height: 20),
            SecondaryButton(
              text: context.intl.commonCancel,
              onPressed: () {
                appRouter.push('/travel/cancel_trip');
              },
            ),
            SizedBox(height: 30),
          ],
        );
      },
    );
  }
}
