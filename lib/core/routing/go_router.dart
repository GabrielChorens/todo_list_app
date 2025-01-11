// ignore_for_file: constant_identifier_names
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list_app/features/auth/ui/screen/auth_screen.dart';
import 'package:todo_list_app/features/dashboard/ui/screen/dashboard_screen.dart';
import 'package:todo_list_app/features/home/ui/screen/home_screen.dart';
import 'package:todo_list_app/features/language/ui/language_screen.dart';
import 'package:todo_list_app/features/profile/ui/screen/profile_screen.dart';
import 'package:todo_list_app/features/splash/ui/splash_screen.dart';
import 'package:todo_list_app/features/theming/ui/screens/theme_gallery_screen.dart';

part 'routes.dart';
part 'routing_utils.dart';

final navigatorKey = GlobalKey<NavigatorState>();

GoRouter router = GoRouter(
  initialLocation: Routes.splash,
  debugLogDiagnostics: kDebugMode,
  routes: [
    standardRoute(
      path: Routes.splash,
      name: Routes.splash,
      page: const SplashScreen(),
    ),
    standardRoute(
      path: Routes.auth,
      name: Routes.auth,
      page: const AuthScreen(),
    ),
    standardRoute(
      path: Routes.home,
      name: Routes.home,
      page: const HomeScreen(),
      routes: [
        horizontalTransitionRoute(
          path: Routes.themeSelection,
          name: Routes.themeSelection,
          page: const ThemeGalleryScreen(),
        ),
        horizontalTransitionRoute(
          path: Routes.lang,
          name: Routes.lang,
          page: const LanguageScreen(),
        ),
        horizontalTransitionRoute(
          path: Routes.profile,
          name: Routes.profile,
          page: const ProfileScreen(),
        ),
        horizontalTransitionRoute(
          path: Routes.dashboard,
          name: Routes.dashboard,
          page: const DashboardScreen(),
        ),
      ],
    ),
  ],
);
