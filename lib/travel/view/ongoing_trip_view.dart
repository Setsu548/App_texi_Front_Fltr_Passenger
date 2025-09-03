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
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class OngoingTripView extends HookWidget {
  const OngoingTripView({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(context.intl.titleTripInProgress),
        SizedBox(height: 10),
        BodyText(context.intl.bodyTripDetails),
        SizedBox(height: 10),
        InfoTileFlatSecondary(
          icon: Icons.send, 
          colorIcon: lightColorScheme.surfaceVariant,
          title: context.intl.labelOrigin, 
          description: 'Av. America 1240, Cochabamba'
        ),
        SizedBox(height: 10),
        InfoTileFlatSecondary(
          icon: Icons.flag, 
          colorIcon: lightColorScheme.surfaceVariant,
          title: context.intl.labelDestination, 
          description: 'Terminal de Buses, Av. Ayacucho'
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelText(context.intl.labelEstimatedDistance),
                BodyText('5.2 km')
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelText(context.intl.labelEstimatedTime),
                BodyText('15 min')
              ],
            )
          ],
        ),
        SizedBox(height: 10),
        CardTertiary(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabelText(context.intl.labelFare),
                BodyText('\$85.00', color: lightColorScheme.surfaceVariant)
              ],
            )
          ],
        ),
        SizedBox(height: 10),
        DriverInfo(
          personName: "Miguel Angel Rojas",
          vehicleName: "Toyota Corolla - Gris",
          licensePlate: "ABC-123",
          avatarUrl: "assets/images/texi.png",
          rating: 4.8,
        ),
        SizedBox(height: 30),
        SecondaryButtonIcon(
          text: context.intl.btnSafeTrip, 
          onPressed: (){
            appRouter.push('/travel/trip_safety');
          }, 
          icon: Icons.shield_sharp
        )
      ],
    );
  }
}