import 'package:app_texi_passenger/app/widgets/body_text_widget.dart';
import 'package:app_texi_passenger/app/widgets/card_primary_widget.dart';
import 'package:app_texi_passenger/app/widgets/info_tile_flat_widget.dart';
import 'package:app_texi_passenger/app/widgets/primary_button_widget.dart';
import 'package:app_texi_passenger/app/widgets/search_bar_widget.dart';
import 'package:app_texi_passenger/app/widgets/title_text_widget.dart';
import 'package:app_texi_passenger/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DestinationSelectionView extends HookWidget {
  const DestinationSelectionView({super.key});

  @override
  Widget build(BuildContext context) {

    final tiles = [
      {'title': 'Av. Petrolera Sur 1602', 'description': 'Barrio Don Bosco'},
      {'title': 'Paseo de ka ReformaAranjuez 222' , 'description': 'Juarez, America'},
      {'title': 'Calle Roble 45', 'description': 'Santa Maria la Ribera'},
    ];

    final places = [
      {'name': 'Cochabamba'},
      {'name': 'Quillacollo'},
      {'name': 'Sipe Sipe'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText('Selecciona tu destino'),
        SizedBox(height: 30),
        CustomSearchBar(
          icon: Icons.send,
          iconColor: lightColorScheme.surfaceVariant,
          hintText: 'Ingresa tu dirección',
          suggestionsBuilder: (context, controller) {
            final input = controller.value.text.toLowerCase();
            if (input.isEmpty) return [];

            final filtered = places.where((place) =>
                place['name']!.toLowerCase().contains(input));

            return filtered.map((place) {
              return ListTile(
                title: BodyText(place['name']!),
                onTap: () => controller.closeView(place['name']),
              );
            });
          },
        ),
        SizedBox(height: 10),
        CardPrimary(
          children: List.generate(tiles.length, (index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoTileFlat(
                  icon: Icons.restore_outlined,
                  title: tiles[index]['title']!,
                  description: tiles[index]['description']!,
                ),
                SizedBox(height: 10,),
                if (index != tiles.length - 1) 
                  Column(
                    children: [
                      Divider(
                      color: lightColorScheme.secondaryContainer,
                      thickness: 10,
                      ),
                      SizedBox(height: 10)
                    ],
                  )
              ],
            );
          }),
        ),
        SizedBox(height: 20),
        PrimaryButton(text: 'Continuar', onPressed: (){})
      ],
    );
  }
}