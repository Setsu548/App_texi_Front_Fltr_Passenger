import 'package:app_texi_passenger/navigation/screen/contacts_screen.dart';
import 'package:app_texi_passenger/navigation/screen/operator_texi_screen.dart';
import 'package:app_texi_passenger/navigation/screen/profile_screen.dart';
import 'package:app_texi_passenger/navigation/screen/saved_destinations_screen.dart';
import 'package:app_texi_passenger/navigation/screen/travel_history_screen.dart';
import 'package:app_texi_passenger/security/screen/account_verification_screen.dart';
import 'package:app_texi_passenger/security/screen/profile_data_screen.dart';
import 'package:app_texi_passenger/travel/screen/destination_selection_screen.dart';
import 'package:app_texi_passenger/travel/screen/driver_tracking_screen.dart';
import 'package:app_texi_passenger/travel/screen/ongoing_trip_screen.dart';
import 'package:app_texi_passenger/travel/screen/travel_rating_screen.dart';
import 'package:app_texi_passenger/travel/screen/travel_request_screen.dart';
import 'package:app_texi_passenger/travel/screen/trip_safety_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../security/screen/security_login_screen.dart';
import 'screen/app_demo_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final _rootNavigatorKey = GlobalKey<NavigatorState>();

CustomTransitionPage getBuilder(GoRouterState state, {required Widget screen}) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: screen,
    transitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
        child: child,
      );
    },
  );
}

final GoRouter appRouter = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/security/login',
  // redirect: (context, state) async {
  // },
  routes: [
    GoRoute(
      path: '/demo',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const AppDemoScreen(),
        );
      },
    ),
    GoRoute(
      path: '/security/login',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const SecurityLoginScreen(),
        );
      },
    ),
    GoRoute(
      path: '/security/account_verification',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const AccountVerificationScreen(),
        );
      },
    ),
    GoRoute(
      path: '/security/profile_data',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const ProfileDataScreen(),
        );
      },
    ),
    GoRoute(
      path: '/travel/travel_request',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const TravelRequestScreen(),
        );
      },
    ),
    GoRoute(
      path: '/travel/destination_selection',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const DestinationSelectionScreen(),
        );
      },
    ),
    GoRoute(
      path: '/travel/driver_tracking',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const DriverTrackingScreen(),
        );
      },
    ),
    GoRoute(
      path: '/travel/ongoing_trip',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const OngoingTripScreen(),
        );
      },
    ),
    GoRoute(
      path: '/travel/trip_safety',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const TripSafetyScreen(),
        );
      },
    ),
    GoRoute(
      path: '/travel/travel_rating',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const TravelRatingScreen(),
        );
      },
    ),
    GoRoute(
      path: '/navigation/profile',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const ProfileScreen(),
        );
      },
    ),
    GoRoute(
      path: '/navigation/travel_history',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const TravelhistoryScreen(),
        );
      },
    ),
    GoRoute(
      path: '/navigation/saved_destinations',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const SavedDestinationsScreen(),
        );
      },
    ),
    GoRoute(
      path: '/navigation/operator_texi',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const OperatorTexiScreen(),
        );
      },
    ),
    GoRoute(
      path: '/navigation/contacts',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const ContactsScreen(),
        );
      },
    ),
  ]
);

extension GoRouterExtension on GoRouter {
  void popUntil(String location, {Object? extra}) {
    while (routerDelegate.currentConfiguration.matches.last.matchedLocation != location) {
      if (!canPop()) {
        return;
      }
      pop(extra);
    }
  }
}

extension GoRouterHelper on BuildContext {
  void popUntil(String location, {Object? extra}) => GoRouter.of(this).popUntil(location, extra: extra);
}