import 'package:app_texi_passenger/app/app_router.dart';
import 'package:app_texi_passenger/app/widgets/body_text_widget.dart';
import 'package:app_texi_passenger/app/widgets/dual_text_line_widget.dart';
import 'package:app_texi_passenger/app/widgets/info_tile_flat_secondary_widget.dart';
import 'package:app_texi_passenger/app/widgets/info_tile_flat_widget.dart';
import 'package:app_texi_passenger/app/widgets/label_text_widget.dart';
import 'package:app_texi_passenger/app/widgets/secondary_button_widget.dart';
import 'package:app_texi_passenger/app/widgets/title_text_widget.dart';
import 'package:app_texi_passenger/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DriverTrackingView extends HookWidget {
  const DriverTrackingView({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText('Seguimiento en tiempo real'),
        SizedBox(height: 10),
        LabelText('Tu conductor esta en camino'),
        SizedBox(height: 30),
        InfoTileFlat(
          icon: Icons.car_crash_outlined, 
          colorIcon: lightColorScheme.surfaceVariant,
          title: 'Toyota Corolla - Gris', 
          description: 'ABC-123'
        ),
        SizedBox(height: 10),
        LabelText('Tiempo estimado de llegada'),
        SizedBox(height: 10),
        DualTextLine(leftText: '5 minutos', rightText: 'En camino'),
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
        SizedBox(height: 30),
        SecondaryButton(text: 'Cancelar Viaje', onPressed: (){
          appRouter.push('/travel/ongoing_trip');
        })
      ],
    );
  }
}