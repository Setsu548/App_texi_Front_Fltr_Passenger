import 'package:app_texi_passenger/app/widgets/body_text_widget.dart';
import 'package:app_texi_passenger/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_passenger/app/widgets/label_text_widget.dart';
import 'package:app_texi_passenger/app/widgets/link_text_primary_widget.dart';
import 'package:app_texi_passenger/app/widgets/pill_switch_widget.dart';
import 'package:app_texi_passenger/app/widgets/primary_variant_button.dart';
import 'package:app_texi_passenger/app/widgets/profile_identity_tile_widget.dart';
import 'package:app_texi_passenger/app/widgets/title_text_widget.dart';
import 'package:app_texi_passenger/l10n/l10n_extension.dart';
import 'package:app_texi_passenger/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProfileView extends HookWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: TitleText(
            context.intl.titleProfileView,
          ),
        ),
        Divider(
          thickness: 8,               
          color: lightColorScheme.secondaryContainer,
          height: 40,                  
        ),
        ProfileIdentityTile(
          name: 'María Perez F',
          idValue: '10012001',
          avatarImage: NetworkImage(''), 
        ),
        SizedBox(height: 20),
        CardOnSurface(
          backgroundColor: lightColorScheme.secondary,
          padding: EdgeInsetsGeometry.all(20),
          children: [
            BodyText(context.intl.bodyProfileViewPersonalInfo),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BodyText(context.intl.labelProfileViewName),
                BodyText('Carlos Rodriguez')
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BodyText(context.intl.labelProfileViewPhone),
                BodyText('+591 77777777')
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: LinkTextPrimary(context.intl.linkProfileViewEditInfo, onTap: (){})
            )
          ],
        ),
        SizedBox(height: 20),
        CardOnSurface(
          backgroundColor: lightColorScheme.secondary,
          padding: EdgeInsetsGeometry.all(20),
          children: [
            BodyText(context.intl.bodyProfileViewSettings),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BodyText(context.intl.labelProfileViewLanguage),
                InkWell(
                  onTap: () {},
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  splashFactory: NoSplash.splashFactory,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: lightColorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: lightColorScheme.onSurface),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BodyText(context.intl.optionProfileViewLanguageSpanish),
                        SizedBox(width: 6),
                        Icon(Icons.arrow_drop_down_rounded,
                          size: 18, color: lightColorScheme.onSurface
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BodyText(context.intl.labelProfileViewDarkMode),
                PillSwitch(
                  value: false, 
                  onChanged: (e){}
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BodyText(context.intl.labelProfileViewNotifications),
                PillSwitch(
                  value: false, 
                  onChanged: (e){}
                )
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        CardOnSurface(
          backgroundColor: lightColorScheme.secondary,
          padding: EdgeInsetsGeometry.all(20),
          children: [
            BodyText(context.intl.bodyProfileViewPaymentMethods),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.credit_card, color: lightColorScheme.primary),
                    SizedBox(width: 10),
                    LabelText(context.intl.labelProfileViewCash)
                  ],
                ),
                Icon(Icons.chevron_right, color: lightColorScheme.onSurface)
              ],
            ),
            SizedBox(height: 20),
            LinkTextPrimary(context.intl.linkProfileViewAddPaymentMethod, onTap: (){})
          ],
        ),
        SizedBox(height: 20),
        PrimaryVariantButton(
          text: context.intl.btnProfileViewLogout, 
          backgroundColor: lightColorScheme.secondary,
          borderColor: lightColorScheme.error,
          foregroundColor: lightColorScheme.error,
          onPressed: () {}
        ),
        SizedBox(height: 20),
        PrimaryVariantButton(
          text: context.intl.btnProfileViewBack, 
          backgroundColor: lightColorScheme.secondary,
          borderColor: lightColorScheme.primary,
          foregroundColor: lightColorScheme.onSurface,
          onPressed: () {}
        ),
      ],
    );
  }
}