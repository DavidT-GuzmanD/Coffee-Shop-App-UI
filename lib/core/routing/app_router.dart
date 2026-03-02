import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/main/presentation/pages/main_shell_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/home/data/models/coffee.dart';
import '../../features/detail/presentation/pages/detail_page.dart';
import '../../features/order/presentation/pages/order_page.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: '/detail',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final coffee = state.extra as Coffee;
          return DetailPage(coffee: coffee);
        },
      ),
      GoRoute(
        path: '/order',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final args = state.extra as OrderArgs;
          return OrderPage(args: args);
        },
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return MainShellPage(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            parentNavigatorKey: _shellNavigatorKey,
            builder: (context, state) => const HomePage(),
          ),
          // Additional shell routes will go here
        ],
      ),
    ],
  );
}
