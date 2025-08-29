import 'package:app_texi_passenger/app/app_router.dart';
import 'package:app_texi_passenger/app/widgets/avatar_text_widget.dart';
import 'package:app_texi_passenger/app/widgets/double_icon_button_secondary_widget.dart';
import 'package:app_texi_passenger/app/widgets/label_text_widget.dart';
import 'package:app_texi_passenger/app/widgets/primary_button_widget.dart';
import 'package:app_texi_passenger/app/widgets/secondary_button_widget.dart';
import 'package:app_texi_passenger/app/widgets/title_text_widget.dart';
import 'package:app_texi_passenger/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TripSafetyView extends HookWidget {
  const TripSafetyView({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText('Seguridad en viaje'),
        SizedBox(height: 10),
        LabelText('Comparte tu ubicacion y acude a contactos de emergencia'),
        SizedBox(height: 10),
        TitleText('Contactos frecuentes'),
        SizedBox(height: 20),
        SizedBox(
          width: double.infinity, 
          child: Wrap(
            alignment: WrapAlignment.spaceEvenly, 
            runAlignment: WrapAlignment.center,  
            spacing: 30,       
            runSpacing: 16,   
            children: [
              AvatarText(
                text: 'Juana',
                imageUrl: 'assets/images/texi.png',
              ),
              AvatarText(text: 'Pedro'),
              AvatarText(text: 'Carlos'),
            ],
          ),
        ),
        SizedBox(height: 20),
        PrimaryButton(
          text: 'Compartir ubicacion en tiempor real', 
          onPressed: (){
            appRouter.push('/travel/travel_rating');
          }
        ),
        SizedBox(height: 30),
        TitleText('Contactos de emergencia'),
        SizedBox(height: 20),
        DoubleIconButtonSecondary(
          leadingIcon: Icons.car_crash,
          title: "TEXI",
          description: "Atencion al cliente",
          trailingIcon: Icons.call,
          onTap: () {},     
        ),
        SizedBox(height: 10),
        DoubleIconButtonSecondary(
          leadingIcon: Icons.support_agent,
          title: "Soporte tecnico",
          description: "Llama soporte tecnico",
          trailingIcon: Icons.call,
          onTap: () {},
          leadingBackgroundColor: lightColorScheme.surfaceVariant,        
          trailingBackgroundColor: lightColorScheme.surfaceVariant,      
        ),
        SizedBox(height: 10),
        DoubleIconButtonSecondary(
          leadingIcon: Icons.warning,
          title: "EMERGENCIAS",
          description: "Llamar emergencias",
          trailingIcon: Icons.call,
          onTap: () {},
          leadingBackgroundColor: lightColorScheme.error,     
          leadingIconColor: lightColorScheme.onSurface,         
          trailingBackgroundColor: lightColorScheme.error,   
          trailingIconColor: lightColorScheme.onSurface,      
        ),
        SizedBox(height: 30),
        SecondaryButton(
          text: 'Volver', 
          onPressed: (){
            appRouter.push('/travel/ongoing_trip');
          }
        )
      ],
      
    );
  }
}