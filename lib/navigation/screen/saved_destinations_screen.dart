import 'package:app_texi_passenger/navigation/view/saved_destinations_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../app/app_scaffold.dart';

class SavedDestinationsScreen extends HookWidget {
  const SavedDestinationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      
      loadingOverlay: true,
      appBar: null, 
      disableBackButton: true,
      onBackButtonPressed: () async {
        return Future.value(true);
      },
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          SizedBox(height: 40),
          SavedDestinationsView()
        ]
      ),
    );
  }
}
