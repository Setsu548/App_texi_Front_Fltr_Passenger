import 'package:app_texi_passenger/app/widgets/body_text_widget.dart';
import 'package:app_texi_passenger/app/widgets/date_picker_field_widget.dart';
import 'package:app_texi_passenger/app/widgets/label_text_widget.dart';
import 'package:app_texi_passenger/app/widgets/primary_variant_button.dart';
import 'package:app_texi_passenger/app/widgets/title_text_widget.dart';
import 'package:app_texi_passenger/app/widgets/trip_receipt_tile_widget.dart';
import 'package:app_texi_passenger/l10n/l10n_extension.dart';
import 'package:app_texi_passenger/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TravelHistoryView extends HookWidget {
  const TravelHistoryView({super.key});

  @override
  Widget build(BuildContext context) {

    final trips = <TripReceiptTile>[
      TripReceiptTile(
        id: '12458',
        title: 'Centro Comercial - Aeropuerto',
        dateTimeText: '15 Mar, 2023 - 08:30 AM',
        driverName: 'Carlos Mendoza',
        priceText: '\$180.00',
      ),
      TripReceiptTile(
        id: '12459',
        title: 'Plaza Central - Residencial 14 de Septiembre',
        dateTimeText: '15 Mar, 2023 - 10:15 AM',
        driverName: 'María González',
        priceText: '\$120.00',
      ),
      TripReceiptTile(
        id: '12460',
        title: 'Hospital General - Terminal de Buses',
        dateTimeText: '15 Mar, 2023 - 12:45 PM',
        driverName: 'Roberto Sánchez',
        priceText: '\$95.00',
      ),
      TripReceiptTile(
        id: '12461',
        title: 'Universidad Mayor de San Simón',
        dateTimeText: '15 Mar, 2023 - 03:20 PM',
        driverName: 'Ana Luisa Pérez',
        priceText: '\$75.00',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(context.intl.titleTravelHistoryView),
        SizedBox(height: 20),
        LabelText(context.intl.labelTravelHistorySelectedDate),
        BodyText('15 de Julio, 2025', color: lightColorScheme.surfaceVariant),
        SizedBox(height: 10),
        DatePickerField(
          dateText: '15/07/2025',
          onTap: () {},
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BodyText(context.intl.bodyTravelHistoryTripsMade),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              decoration: BoxDecoration(
                color: lightColorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(12), 
              ),
              child: LabelText('25', color: lightColorScheme.surface),
            )
          ],
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: trips.length,
          itemBuilder: (context, i) {
            return Column(
              children: [
                trips[i],
                SizedBox(height: 10)
              ],
            );
          },
        ),
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