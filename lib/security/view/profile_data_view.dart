import 'package:app_texi_passenger/app/app_router.dart';
import 'package:app_texi_passenger/app/widgets/body_text_widget.dart';
import 'package:app_texi_passenger/app/widgets/card_secondary_widget.dart';
import 'package:app_texi_passenger/app/widgets/labeled_text_field_widget.dart';
import 'package:app_texi_passenger/app/widgets/primary_button_widget.dart';
import 'package:app_texi_passenger/app/widgets/title_text_widget.dart';
import 'package:app_texi_passenger/l10n/l10n_extension.dart';
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
        TitleText(context.intl.titleProfileInformation),
        SizedBox(height: 10),
        BodyText(context.intl.bodyPleaseEnterYourData),
        SizedBox(height: 30),
        CardSecondary(
          children: [
            LabeledTextField(
              label: context.intl.labelFullNameRequired, 
              hint: context.intl.hintFullNameExample
            ),
            LabeledTextField(
              label: context.intl.labelPhoneNumberRequired, 
              hint: '7777777',
              prefixText: '+591',
            ),
          ],
        ),
        SizedBox(height: 20),
        PrimaryButton(
          text: context.intl.btnContinue, 
          onPressed: (){
            appRouter.go('/travel/travel_request');
          }
        ),
        SizedBox(height: 20),
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.labelLarge,
            children: [
              TextSpan(text: context.intl.bodyContinueAcceptsPrefix),
              TextSpan(
                text: context.intl.linkTermsConditions,
                style: TextStyle(color: lightColorScheme.surfaceVariant),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
              TextSpan(text: context.intl.bodyAndConnector),
              TextSpan(
                text: context.intl.linkPrivacyPolicy,
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