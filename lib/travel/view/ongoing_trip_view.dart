import 'package:app_texi_passenger/app/app_router.dart';
import 'package:app_texi_passenger/app/widgets/body_text_widget.dart';
import 'package:app_texi_passenger/app/widgets/card_tertiary_widget.dart';
import 'package:app_texi_passenger/app/widgets/info_tile_flat_secondary_widget.dart';
import 'package:app_texi_passenger/app/widgets/label_text_widget.dart';
import 'package:app_texi_passenger/app/widgets/secondary_button_icon_widget.dart';
import 'package:app_texi_passenger/app/widgets/title_text_widget.dart';
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
        TitleText('Viaje en curso'),
        SizedBox(height: 10),
        BodyText('Detalles del viaje'),
        SizedBox(height: 10),
        InfoTileFlatSecondary(
          icon: Icons.send, 
          colorIcon: lightColorScheme.surfaceVariant,
          title: 'Origen', 
          description: 'Av. America 1240, Cochabamba'
        ),
        SizedBox(height: 10),
        InfoTileFlatSecondary(
          icon: Icons.flag, 
          colorIcon: lightColorScheme.surfaceVariant,
          title: 'Destino', 
          description: 'Terminal de Buses, Av. Ayacucho'
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelText('Distancia estimada'),
                BodyText('5.2 km')
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelText('Tiempo estimado'),
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
                LabelText('Tarifa'),
                BodyText('\$85.00', color: lightColorScheme.surfaceVariant)
              ],
            )
          ],
        ),
        SizedBox(height: 30),
        SecondaryButtonIcon(
          text: 'Viaje seguro', 
          onPressed: (){
            appRouter.push('/travel/trip_safety');
          }, 
          icon: Icons.shield_sharp
        )
      ],
    );
  }
}