import 'package:app_texi_passenger/app/app_bar_logo_home.dart';
import 'package:app_texi_passenger/app/widgets/secondary_loading_widget.dart';
import 'package:app_texi_passenger/navigation/view/side_menu_view.dart';
import 'package:app_texi_passenger/travel/view/driver_tracking_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../app/app_scaffold.dart';

class DriverTrackingScreen extends HookWidget {
  const DriverTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final isReady = useState(false);
    final isMounted = useIsMounted();

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        try {
          await Future.delayed(const Duration(milliseconds: 900));

        } finally {
          if (isMounted()) isReady.value = true;
        }
      });
      return null;
    }, const []);

    if (!isReady.value) {
      return SecondaryLoading();
    }

    return AppScaffold(
      loadingOverlay: true,
      appBar: AppBarLogoHome(context),
      endDrawer: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.paddingOf(context).top - 50 + kToolbarHeight,
        ),
        child: Drawer(
          child: SideMenuView(),
        ),
      ),
      disableBackButton: true,
      onBackButtonPressed: () async {
        return Future.value(true);
      },
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          SizedBox(height: 10),
          DriverTrackingView()
        ]
      ),
    );
  }
}
