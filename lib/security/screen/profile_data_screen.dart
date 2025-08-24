import 'package:app_texi_passenger/security/view/profile_data_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../app/app_scaffold.dart';

class ProfileDataScreen extends HookWidget {
  const ProfileDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: null,
      loadingOverlay: true,
      disableBackButton: true,
      onBackButtonPressed: () async {
        return Future.value(true);
      },
      body: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: SingleChildScrollView(
          child: ProfileDataView()
        ),
      ),
    );
  }
}
