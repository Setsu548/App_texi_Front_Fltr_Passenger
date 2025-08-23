import 'package:app_texi_passenger/app/widgets/body_text_bold_widget.dart';
import 'package:app_texi_passenger/app/widgets/body_text_primary_widget.dart';
import 'package:app_texi_passenger/app/widgets/body_text_widget.dart';
import 'package:app_texi_passenger/app/widgets/card_secondary_widget.dart';
import 'package:app_texi_passenger/app/widgets/danger_button_widget.dart';
import 'package:app_texi_passenger/app/widgets/inline_button_widget.dart';
import 'package:app_texi_passenger/app/widgets/label_text_primary_widget.dart';
import 'package:app_texi_passenger/app/widgets/label_text_secondary_widget.dart';
import 'package:app_texi_passenger/app/widgets/label_text_widget.dart';
import 'package:app_texi_passenger/app/widgets/labeled_dropdown_widget.dart';
import 'package:app_texi_passenger/app/widgets/labeled_text_field_widget.dart';
import 'package:app_texi_passenger/app/widgets/primary_button_widget.dart';
import 'package:app_texi_passenger/app/widgets/radio_group_row_widget.dart';
import 'package:app_texi_passenger/app/widgets/radio_group_widget.dart';
import 'package:app_texi_passenger/app/widgets/secondary_button_widget.dart';
import 'package:app_texi_passenger/app/widgets/small_text_secondary_widget.dart';
import 'package:app_texi_passenger/app/widgets/small_text_widget.dart';
import 'package:app_texi_passenger/app/widgets/title_text_widget.dart';
import 'package:app_texi_passenger/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../app_bar_logo.dart';
import '../app_scaffold.dart';

class AppDemoScreen extends HookWidget {
  const AppDemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useTabController(initialLength: 5, initialIndex: 0);
    useListenable(controller);

    return AppScaffold(
    loadingOverlay: true,
    appBar: AppBarLogo(context),
    body: TabBarView(
      controller: controller,
      children: const [
        AppDemoTextsView(),
        AppDemoBtnView(),
        AppDemoCardView(),
        AppDemoFormView(),
        Center(child: Text("Otros")),
      ],
    ),
    bottomBar: SafeArea( // 👈 evita que se pegue a los botones del sistema
      child: TabBar(
        controller: controller,
        tabs: const [
          Tab(text: 'Txt'),
          Tab(text: 'Btn'),
          Tab(text: 'Cards'),
          Tab(text: 'Form'),
          Tab(text: 'Otros'),
        ],
      ),
    ),
  );
  }
}
class AppDemoTextsView extends HookWidget {
  const AppDemoTextsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding( 
              padding: EdgeInsets.all(10), 
              child: TitleText('TITLE TEXT'),
            ),
            Padding( 
              padding: EdgeInsets.all(10), 
              child: BodyText('BODY TEXT'),
            ),
            Padding( 
              padding: EdgeInsets.all(10), 
              child: BodyTextBold('BODY TEXT BOLD'),
            ),
            Padding( 
              padding: EdgeInsets.all(10), 
              child: BodyTextPrimary('BODY TEXT PRIMARY'),
            ),
            Padding( 
              padding: EdgeInsets.all(10), 
              child: LabelText('LABEL TEXT'),
            ),
            Padding( 
              padding: EdgeInsets.all(10), 
              child: LabelTextPrimary('LABEL TEXT PRIMARY'),
            ),
            Container( 
              padding: EdgeInsets.all(10), 
              decoration: BoxDecoration(
                color: lightColorScheme.secondaryContainer, 
                borderRadius: BorderRadius.circular(12), 
              ),
              child: LabelTextSecondary('LABEL TEXT SECONDARY'),
            ),
            Padding( 
              padding: EdgeInsets.all(10), 
              child: SmallText('SMALL TEXT'),
            ),
            Container( 
              padding: EdgeInsets.all(10), 
              decoration: BoxDecoration(
                color: lightColorScheme.secondaryContainer, 
                borderRadius: BorderRadius.circular(12)
              ),
              child: SmallTextSecondary('SMALL TEXT SECONDARY')
            ),
          ],
        ),
      )
    ); 
  }
}


class AppDemoBtnView extends HookWidget {
  const AppDemoBtnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            PrimaryButton(
              text: 'Primary Button', 
              onPressed: () {}
            ),
            SizedBox(height: 10),
            SecondaryButton(
              text: 'Secondary Button',
              onPressed: () {},
            ),
            SizedBox(height: 10),
            DangerButton(
              text: 'Danger Button', 
              onPressed: () {}
            ),
            SizedBox(height: 10,),
            InlineButton(
              text: 'Inline Button',
              onPressed: () {},
            )
          ],
        )
      )
    );
  }
}


class AppDemoCardView extends HookWidget {
  const AppDemoCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            CardSecondary(children: [Text('Card Secondary')])
          ]
        )
      )
    );
  }
}

class AppDemoFormView extends HookWidget {
  const AppDemoFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CardSecondary(
                children: [
                  LabeledTextField(
                    label: "Nombres*",
                    hint: "Ej. Juan Diego",
                  ),
                  LabeledTextField(
                    label: "Apellidos*",
                    hint: "Ej. Dias Soto",
                  ),
                  LabeledTextField(
                    label: "Numero de Telefono*",
                    hint: "77777777",
                    keyboardType: TextInputType.number,
                    prefixText: '+591',
                  ),
                  LabeledDropdown<String>(
                    label: "Departamento",
                    hint: "Selecciona una ciudad",
                    items: [
                      DropdownMenuItem(
                        value: "Cochabamba",
                        child: BodyText("Cochabamba", color: lightColorScheme.surface),
                      ),
                      DropdownMenuItem(
                        value: "La Paz",
                        child: BodyText("La Paz", color: lightColorScheme.surface),
                      ),
                      DropdownMenuItem(
                        value: "Santa Cruz",
                        child: BodyText("Santa Cruz", color: lightColorScheme.surface),
                      ),
                    ],
                  ),
                  RadioGroup(
                    label: 'Color*',
                    options: ["Blanco", "Negro", "Gris", "Rojo", "Azul", "Verde", "Plata", "Otro"],
                  ),
                  RadioGroupRow(
                    label: 'Tipo de Vehiculo',
                    options: ["Sedan", "SUV", "Hatchback"],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
