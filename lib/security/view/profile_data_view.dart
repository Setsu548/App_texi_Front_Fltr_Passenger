import 'package:app_texi_passenger/app/widgets/body_text_widget.dart';
import 'package:app_texi_passenger/app/widgets/card_secondary_widget.dart';
import 'package:app_texi_passenger/app/widgets/labeled_text_field_widget.dart';
import 'package:app_texi_passenger/app/widgets/primary_button_widget.dart';
import 'package:app_texi_passenger/app/widgets/title_text_widget.dart';
import 'package:app_texi_passenger/theme/main_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProfileDataView extends HookWidget {
  const ProfileDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText('Información de Perfil'),
        SizedBox(height: 10),
        BodyText('Por favor ingresa tus datos.'),
        SizedBox(height: 30),
        CardSecondary(
          children: [
            LabeledTextField(
              label: 'Nombre Completo*', 
              hint: 'Ej. Juan Perez Rodriguez'
            ),
            LabeledTextField(
              label: 'Número de teléfono*', 
              hint: '7777777',
              prefixText: '+591',
            ),
          ],
        ),
        SizedBox(height: 20),
        PrimaryButton(text: 'Continuar', onPressed: (){}),
        SizedBox(height: 20),
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.labelLarge,
            children: [
              const TextSpan(text: 'Al continuar aceptas los '),
              TextSpan(
                text: 'términos, condiciones',
                style: TextStyle(color: lightColorScheme.surfaceVariant),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
              const TextSpan(text: ' y '),
              TextSpan(
                text: 'política de privacidad',
                style: TextStyle(color: lightColorScheme.surfaceVariant),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
            ],
          ),
        )
      ],
    );
  }
}