import 'package:app_texi_passenger/app/widgets/body_text_widget.dart';
import 'package:app_texi_passenger/app/widgets/link_text_primary_widget.dart';
import 'package:app_texi_passenger/app/widgets/label_text_widget.dart';
import 'package:app_texi_passenger/app/widgets/primary_button_widget.dart';
import 'package:app_texi_passenger/app/widgets/title_text_widget.dart';
import 'package:app_texi_passenger/theme/main_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AccountVerificationView extends HookWidget {
  const AccountVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(20), 
              decoration: BoxDecoration(
                color: lightColorScheme.primary,
                shape: BoxShape.circle, 
              ),
              child: Icon(
                Icons.shield,
                size: 48, 
                color: lightColorScheme.surface, 
              ),
            ),
            SizedBox(height: 25),
            TitleText('Verificación de cuenta'),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 30),
              child: BodyText('Ingresa el código de verificación que enviaremos a tu WhatsApp'),
            ),
            SizedBox(height: 25),
            PrimaryButton(text: 'Verificar', onPressed: () {}),
            SizedBox(height: 25),
            LabelText('¿No recibiste el código?'),
            SizedBox(height: 10),
            LinkTextPrimary('Reenviar código', onTap: (){},)
          ],
        ),
      ],
    );
  }
}