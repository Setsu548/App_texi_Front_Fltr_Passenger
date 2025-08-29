import 'package:app_texi_passenger/app/widgets/label_text_widget.dart';
import 'package:app_texi_passenger/app/widgets/link_text_secondary_widget.dart';
import 'package:app_texi_passenger/app/widgets/primary_button_widget.dart';
import 'package:app_texi_passenger/app/widgets/star_rating_widget.dart';
import 'package:app_texi_passenger/app/widgets/title_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TravelRatingView extends HookWidget {
  const TravelRatingView({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        Center(
          child: TitleText('¿Cómo fue tu viaje?'),
        ),
        SizedBox(height: 20),
        Center(
          child: StarRating(
            onRatingChanged: (newRating) {},
          ),
        ),
        SizedBox(height: 20),
        LabelText('Comentarios adicionales (opcional)'),
        SizedBox(height: 10),
        TextField(
          maxLines: 5, 
          decoration: InputDecoration(
            hintText: 'Cuentanos mas sobre tu experiencia...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: EdgeInsets.all(12),
          ),
        ),
        SizedBox(height: 30),
        PrimaryButton(text: 'Enviar calificacion', onPressed: (){}),
        SizedBox(height: 30),
        Center(child: LinkTextSecondary('Omitir por ahora', onTap: (){}))
      ],
    );
  }
}