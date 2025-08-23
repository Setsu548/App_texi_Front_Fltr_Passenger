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
        Center(child: Text("Botones")),
        Center(child: Text("Tarjetas")),
        Center(child: Text("Formulario")),
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
    return Column(
      children: [
        Text('EJEMPLO')
      ]
    );
  }
}