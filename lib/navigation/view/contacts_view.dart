import 'package:app_texi_passenger/app/widgets/body_text_widget.dart';
import 'package:app_texi_passenger/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_passenger/app/widgets/contact_card_tile_widget.dart';
import 'package:app_texi_passenger/app/widgets/label_text_widget.dart';
import 'package:app_texi_passenger/app/widgets/labeled_text_field_widget.dart';
import 'package:app_texi_passenger/app/widgets/primary_button_widget.dart';
import 'package:app_texi_passenger/app/widgets/primary_variant_button.dart';
import 'package:app_texi_passenger/app/widgets/title_text_widget.dart';
import 'package:app_texi_passenger/l10n/l10n_extension.dart';
import 'package:app_texi_passenger/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class ContactsView extends HookWidget {
  const ContactsView({super.key});

  @override
  Widget build(BuildContext context) {

    final contacts = <ContactCardTile>[
      ContactCardTile(
        name: 'Ana Martínez',
        idText: '10023456',
        phoneText: '+591 76543210',
        onEdit: () {},
        onDelete: () {},
      ),
      ContactCardTile(
        name: 'Luis Gomez',
        idText: '10034567',
        phoneText: '+591 65432109',
        onEdit: () {},
        onDelete: () {},
      ),
      ContactCardTile(
        name: 'Carlos Rodriguez',
        idText: '10045678',
        phoneText: '+591 7777777',
        onEdit: () {},
        onDelete: () {},
      ),
      ContactCardTile(
        name: 'Elena Suarez',
        idText: '10056789',
        phoneText: '+591 54321098',
        onEdit: () {},
        onDelete: () {},
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: TitleText(
            context.intl.titleContactsView,
          ),
        ),
        Divider(
          thickness: 8,               
          color: lightColorScheme.secondaryContainer,
          height: 40,                  
        ),
        BodyText(context.intl.bodyContactsMyContacts),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: contacts.length,
          itemBuilder: (context, i) {
            return Column(
              children: [
                contacts[i],
                if (i != contacts.length - 1)
                  const SizedBox(height: 10), 
              ],
            );
          },
        ),
        Row(
          children: [
            Expanded(
              child: BodyText(
                context.intl.bodyContactsShareApp
              )
            ),
            SizedBox(
              width: 150,
              child: Expanded(
                child: PrimaryVariantButton(
                  text: context.intl.btnContactsShare, 
                  backgroundColor: lightColorScheme.secondary,
                  borderColor: lightColorScheme.primary,
                  foregroundColor: lightColorScheme.onSurface,
                  onPressed: () {}
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 25),
        CardOnSurface(
          padding: EdgeInsetsGeometry.all(20),
          backgroundColor: lightColorScheme.secondary,
          children: [
            LabelText(context.intl.bodyContactsInviteHint)
          ],
        ),
        SizedBox(height: 20),
        BodyText(context.intl.bodyContactsAddNew),
        SizedBox(height: 10),
        CardOnSurface(
          padding: EdgeInsetsGeometry.all(20),
          backgroundColor: lightColorScheme.secondary,
          children: [
            LabeledTextField(
              label: context.intl.labelContactsUserIdTx, 
              hint: context.intl.hintContactsEnterId,
              background: lightColorScheme.secondary,
              colorLabel: lightColorScheme.onSurface,
              focusedBorder: lightColorScheme.primary,
            ),
            LabeledTextField(
              label: context.intl.labelContactsName, 
              hint: context.intl.hintContactsEnterName,
              background: lightColorScheme.secondary,
              colorLabel: lightColorScheme.onSurface,
              focusedBorder: lightColorScheme.primary,
            ),
            SizedBox(height: 20),
            PrimaryButton(
              text: context.intl.btnContactsSaveContact, 
              onPressed: (){}
            )
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