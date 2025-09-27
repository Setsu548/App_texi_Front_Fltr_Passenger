import 'package:app_texi_passenger/app/widgets/body_text_widget.dart';
import 'package:app_texi_passenger/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_passenger/app/widgets/double_icon_button_widget.dart';
import 'package:app_texi_passenger/app/widgets/label_text_widget.dart';
import 'package:app_texi_passenger/app/widgets/labeled_dropdown_widget.dart';
import 'package:app_texi_passenger/app/widgets/labeled_text_field_widget.dart';
import 'package:app_texi_passenger/app/widgets/primary_button_widget.dart';
import 'package:app_texi_passenger/app/widgets/primary_variant_button.dart';
import 'package:app_texi_passenger/app/widgets/title_text_widget.dart';
import 'package:app_texi_passenger/l10n/l10n_extension.dart';
import 'package:app_texi_passenger/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class OperatorTexiView extends HookWidget {
  const OperatorTexiView({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(context.intl.titleOperatorTexiView),
        SizedBox(height: 20),
        CardOnSurface(
          padding: EdgeInsetsGeometry.all(20),
          backgroundColor: lightColorScheme.secondary,
          children: [
            BodyText(context.intl.bodyOperatorTexiSendMessage),
            SizedBox(height: 20),
            LabeledTextField(
              label: context.intl.labelOperatorTexiFullName, 
              hint: context.intl.hintOperatorTexiFullName,
              background: lightColorScheme.secondary,
              colorLabel: lightColorScheme.onSurface,
              focusedBorder: lightColorScheme.primary,
            ),
            LabeledDropdown<String>(
              label: context.intl.labelOperatorTexiInquiryType,
              hint: context.intl.hintOperatorTexiInquiryType,
              background: lightColorScheme.secondary,
              colorLabel: lightColorScheme.onSurface,
              focusedBorder: lightColorScheme.primary,
              items: [
                DropdownMenuItem(
                  value: "consulta 1",
                  child: BodyText("consulta 1"),
                ),
                DropdownMenuItem(
                  value: "consulta 2",
                  child: BodyText("consulta 2"),
                ),
                DropdownMenuItem(
                  value: "consulta 3",
                  child: BodyText("consulta 3")
                ),
              ],
            ),
            SizedBox(height: 10),
            LabelText(context.intl.labelOperatorTexiMessage),
            SizedBox(height: 6),
            TextField(
              maxLines: 5, 
              decoration: InputDecoration(
                hintText: context.intl.hintOperatorTexiMessage,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: EdgeInsets.all(12),
              ),
            ),
            SizedBox(height: 20),
            PrimaryButton(
              text: context.intl.btnOperatorTexiSendMessage, 
              onPressed: (){}
            )
          ],
        ),
        SizedBox(height: 20),
        CardOnSurface(
          padding: EdgeInsetsGeometry.all(20),
          backgroundColor: lightColorScheme.secondary,
          children: [
            BodyText(context.intl.bodyOperatorTexiCallHours),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: BodyText(context.intl.labelOperatorTexiMonFri)),
                LabelText('8:00 AM - 8:OO PM', color: lightColorScheme.surfaceVariant)
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: BodyText(context.intl.labelOperatorTexiSaturday)),
                LabelText('9:00 AM - 6:OO PM', color: lightColorScheme.surfaceVariant)
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: BodyText(context.intl.labelOperatorTexiSunday)),
                LabelText('10:00 AM - 4:OO PM', color: lightColorScheme.surfaceVariant)
              ],
            ),
            SizedBox(height: 20),
            DoubleIconButton(
              leadingIcon: Icons.local_taxi, 
              title: context.intl.titleOperatorTexiCall, 
              description: context.intl.descOperatorTexiCustomerService, 
              trailingIcon: Icons.call, 
              onTap: (){}
            ),
            SizedBox(height: 20),
            BodyText(context.intl.bodyOperatorTexiOrContact),
            SizedBox(height: 20),
            DoubleIconButton(
              buttonColor: lightColorScheme.surfaceVariant,
              leadingIcon: Icons.headset_mic, 
              title: context.intl.titleOperatorTexiSupport, 
              description: context.intl.descOperatorTexiSupport, 
              trailingIcon: Icons.call, 
              onTap: (){}
            ),
          ],
        ),
        SizedBox(height: 20),
        PrimaryVariantButton(
          text: context.intl.btnProfileViewBack, 
          backgroundColor: lightColorScheme.secondary,
          borderColor: lightColorScheme.primary,
          foregroundColor: lightColorScheme.onSurface,
          onPressed: () {
            context.pop();
          }
        ),
      ],
    );
  }
}