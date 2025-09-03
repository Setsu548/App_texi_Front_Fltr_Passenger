import 'package:app_texi_passenger/app/app_router.dart';
import 'package:app_texi_passenger/app/widgets/double_icon_button_widget.dart';
import 'package:app_texi_passenger/app/widgets/icon_text_button_widget.dart';
import 'package:app_texi_passenger/app/widgets/image_info_card_widget.dart';
import 'package:app_texi_passenger/app/widgets/info_tile_widget.dart';
import 'package:app_texi_passenger/app/widgets/label_text_widget.dart';
import 'package:app_texi_passenger/app/widgets/primary_button_widget.dart';
import 'package:app_texi_passenger/app/widgets/title_text_widget.dart';
import 'package:app_texi_passenger/l10n/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TravelRequestView extends HookWidget {
  const TravelRequestView({super.key});

  @override
  Widget build(BuildContext context) {

    final selectedIndex = useState<int?>(null);

    final cards = [
      {'title': 'Economico', 'description': '4 Pasajeros', 'price': '5.50'},
      {'title': 'Confort', 'description': '4 pasajeros', 'price': '7.80'},
      {'title': 'Premium', 'description': '6 pasajeros', 'price': '12.30'},
    ];

    final locations = [
      {'icon': Icons.home_work_outlined, 'label': 'Oficina', 'description': 'Av.Reforma 222'},
      {'icon': Icons.home, 'label': 'Casa', 'description': 'Calle Roble 45'},
      {'icon': Icons.restaurant, 'label': 'Restaurante', 'description': 'Plaza Central'},
      {'icon': Icons.local_hospital, 'label': 'Hospital', 'description': 'Av. Blanco Galindo'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(context.intl.titleRequestTrip),
        SizedBox(height: 30),
        IconTextButton(icon: Icons.send, label: context.intl.labelDestination, onTap: (){
          appRouter.push('/travel/destination_selection');
        }),
        SizedBox(height: 10),
        LabelText(context.intl.labelSavedDestinations),
        SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (var location in locations)
                Padding(
                  padding: EdgeInsets.only(right: 10), 
                  child: InfoTile(
                    icon: location['icon']! as IconData,
                    label: location['label'] as String,
                    description: location['description'] as String,
                    onTap: () {},
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: 30),
        TitleText(context.intl.titleSelectYourVehicle),
        SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Wrap(
            spacing: 10,
            children: List.generate(cards.length, (index) {
              final card = cards[index];
              final isSelected = selectedIndex.value == index;

              return ImageInfoCard(
                imageUrl: 'assets/images/texi.png',
                title: card['title']!,
                description: card['description']!,
                price: card['price']!,
                isSelected: isSelected, 
                onTap: () {
                  selectedIndex.value = index; 
                },
              );
            })  ,
          )
        ),
        SizedBox(height: 30),
        PrimaryButton(
          text: context.intl.btnRequestTaxiNow, 
          onPressed: (){
            appRouter.push('/travel/driver_tracking');
          }
        ),
        SizedBox(height: 30),
        TitleText(context.intl.titleRequestVehicleFromOperator),
        SizedBox(height: 20),
        DoubleIconButton(
          leadingIcon: Icons.local_taxi,
          title: context.intl.titleCallTexiOperator,
          description: context.intl.descTexiCentral,
          trailingIcon: Icons.call,
          onTap: () {},
        )
      ],
    );
  }
}