import 'package:fitness_app/features/home/view/home.dart';
import 'package:fitness_app/shared/widgets/navigation/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRouter { home, session, profile }

GoRouter buildRouter() {
  return GoRouter(
    initialLocation: '/home',
    routes: [
      StatefulShellRoute.indexedStack(
        builder:
            (context, state, shell) => BottomNavigationScaffold(shell: shell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                name: AppRouter.home.name,
                pageBuilder:
                    (context, state) => const NoTransitionPage(
                      child: Home(),
                    ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/session',
                name: AppRouter.session.name,
                pageBuilder:
                    (context, state) => const NoTransitionPage(
                      child: Scaffold(body: Center(child: Text('Session'))),
                    ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                name: AppRouter.profile.name,
                pageBuilder:
                    (context, state) => const NoTransitionPage(
                      child: Scaffold(body: Center(child: Text('Profile'))),
                    ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
