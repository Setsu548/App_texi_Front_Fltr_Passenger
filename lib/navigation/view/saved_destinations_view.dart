import 'package:app_texi_passenger/app/widgets/body_text_widget.dart';
import 'package:app_texi_passenger/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_passenger/app/widgets/destination_saved_place_widget.dart';
import 'package:app_texi_passenger/app/widgets/link_text_primary_widget.dart';
import 'package:app_texi_passenger/app/widgets/primary_button_widget.dart';
import 'package:app_texi_passenger/app/widgets/primary_variant_button.dart';
import 'package:app_texi_passenger/app/widgets/recent_place_tile_widget.dart';
import 'package:app_texi_passenger/app/widgets/saved_place_card_widget.dart';
import 'package:app_texi_passenger/app/widgets/search_place_field_widget.dart';
import 'package:app_texi_passenger/app/widgets/title_text_widget.dart';
import 'package:app_texi_passenger/l10n/l10n_extension.dart';
import 'package:app_texi_passenger/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class SavedDestinationsView extends HookWidget {
  const SavedDestinationsView({super.key});

  @override
  Widget build(BuildContext context) {

    final recentPlaces = <RecentPlaceTile>[
      RecentPlaceTile(
        title: 'Restaurante El Cardenal',
        address: 'Av. de la Paz 32, San Ángel',
        statusColor: lightColorScheme.surfaceVariant,
        onTap: () {},
      ),
      RecentPlaceTile(
        title: 'Centro Comercial Hipermaxi',
        address: 'Anillo Periférico Sur 4690',
        statusColor: lightColorScheme.surfaceVariant,
        onTap: () {},
      ),
      RecentPlaceTile(
        title: 'Hospital Ángeles',
        address: 'Camino a Santa Teresa 1055',
        statusColor: lightColorScheme.surfaceVariant,
        onTap: () {},
      ),
    ];

    final selectedIndex = useState<int?>(null);

    final places = [
      'Casa',
      'Trabajo',
      'Otro'
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(context.intl.titleSavedDestinationsView),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BodyText(context.intl.bodySavedDestinationsFavorites),
            LinkTextPrimary(context.intl.linkSavedDestinationsEdit, color: lightColorScheme.surfaceVariant ,onTap: (){})
          ],
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 8),
            children: [
              SizedBox(
                width: 220,
                child: SavedPlaceCard(
                  title: 'Oficina',
                  address: 'Av. Insurgentes Sur 1602, CDMX',
                  leadingIcon: Icons.apartment,
                  onRequestRide: () {},
                  isFavorite: true,
                  onToggleFavorite: () {},
                ),
              ),
              SizedBox(width: 10),
              SizedBox(
                width: 220,
                child: SavedPlaceCard(
                  title: 'Casa',
                  address: 'Calle Durango 145, Zona Norte',
                  leadingIcon: Icons.home_rounded,
                  onRequestRide: () {},
                  isFavorite: true,
                  onToggleFavorite: () {},
                ),
              ),
              SizedBox(width: 10),
              SizedBox(
                width: 220,
                child: SavedPlaceCard(
                  title: 'Gimnasio',
                  address: 'Av. América y Pando',
                  leadingIcon: Icons.fitness_center_rounded,
                  onRequestRide: () {},
                  isFavorite: false,
                  onToggleFavorite: () {},
                ),
              ),
              SizedBox(width: 10),
              SizedBox(
                width: 220,
                child: SavedPlaceCard(
                  title: 'Universidad',
                  address: 'UMSS, Cochabamba',
                  leadingIcon: Icons.school_rounded,
                  onRequestRide: () {},
                  isFavorite: false,
                  onToggleFavorite: () {},
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BodyText(context.intl.bodySavedDestinationsRecent),
            LinkTextPrimary(context.intl.linkSavedDestinationsSeeAll, color: lightColorScheme.surfaceVariant ,onTap: (){})
          ],
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: recentPlaces.length,
          itemBuilder: (context, i) {
            return Column(
              children: [
                recentPlaces[i],
                if (i != recentPlaces.length - 1)
                  const SizedBox(height: 10), 
              ],
            );
          },
        ),
        BodyText(context.intl.bodySavedDestinationsCreateNew),
        SizedBox(height: 10),
        SearchPlaceField(
          onSubmitted: (e) {},
        ),
        SizedBox(height: 20),
        CardOnSurface(
          padding: EdgeInsetsGeometry.all(20),
          backgroundColor: lightColorScheme.secondary,
          children: [
            BodyText(context.intl.labelSavedDestinationsSaveAs), 
            SizedBox(height: 10),
            Row(
              children: List.generate(places.length, (i) {
                final selected = selectedIndex.value == i;
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: DestinationSavedPlace(
                      text: places[i],
                      isSelected: selected,
                      onTap: () => selectedIndex.value = i,
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 10),
            PrimaryButton(
              text: context.intl.btnSavedDestinationsSave, 
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