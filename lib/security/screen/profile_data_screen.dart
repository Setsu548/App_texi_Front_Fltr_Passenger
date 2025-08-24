import 'package:app_texi_passenger/security/view/profile_data_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../app/app_bar_logo.dart';
import '../../app/app_scaffold.dart';

class ProfileDataScreen extends HookWidget {
  const ProfileDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      loadingOverlay: true,
      appBar: AppBarLogo(context),
      disableBackButton: true,
      onBackButtonPressed: () async {
        return Future.value(true);
      },
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          SizedBox(height: 10),
          ProfileDataView()
        ]
      ),
    );
  }
}
