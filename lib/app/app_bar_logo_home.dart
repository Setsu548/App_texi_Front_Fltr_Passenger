import 'package:app_texi_passenger/app/app_responsive.dart';
import 'package:app_texi_passenger/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppBarLogoHome extends HookWidget implements PreferredSizeWidget {
  AppBarLogoHome(BuildContext context, {Key? key})
      : preferredSize = Size.fromHeight(AppResponsive.isSmallScreen(context) ? kToolbarHeight : 120),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: lightColorScheme.surface,
      iconTheme: IconThemeData(color: lightColorScheme.primary),
      title: Text(
        'TEXI',
        style: TextStyle(color: lightColorScheme.primary),
      ),
      centerTitle: true,  
      actions: [
        Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: lightColorScheme.primary),
            onPressed: () => {Scaffold.of(context).openEndDrawer()},
          ),
        ),
      ],
      toolbarHeight: preferredSize.height,
    );
  }
}