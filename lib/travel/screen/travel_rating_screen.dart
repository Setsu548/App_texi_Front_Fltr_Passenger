import 'package:app_texi_passenger/app/app_bar_logo_home.dart';
// import 'package:app_texi_passenger/navigation/view/side_menu_view.dart';
import 'package:app_texi_passenger/travel/view/travel_rating_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../app/app_scaffold.dart';

class TravelRatingScreen extends HookWidget {
  const TravelRatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      loadingOverlay: true,
      appBar: AppBarLogoHome(context,false,false),
      endDrawer: null,
      disableBackButton: true,
      onBackButtonPressed: () async {
        return Future.value(true);
      },
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          SizedBox(height: 10),
          TravelRatingView()
        ]
      ),
    );
  }
}
