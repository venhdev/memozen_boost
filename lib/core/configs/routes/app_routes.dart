import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as ui;
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

abstract final class AppRouters {
  // authentication
  static const String authentication = '/auth';
  static const String signin = 'sign-in';
  static const String profile = 'profile';

  static GoRouter routes = GoRouter(
    observers: [
      FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
      GoRouterObserver(),
    ],
    initialLocation: authentication,
    routes: [
      authenticationRoutes,
    ],
  );

  static GoRoute authenticationRoutes = GoRoute(
    path: authentication,
    name: authentication,
    redirect: (context, state) =>
        FirebaseAuth.instance.currentUser == null ? '$authentication/$signin' : '$authentication/$profile',
    routes: [
      GoRoute(
        path: signin,
        name: signin,
        builder: (context, state) {
          return ui.SignInScreen(
            providers: [
              ui.EmailAuthProvider(),
            ],
            actions: [
              ui.AuthStateChangeAction<ui.SignedIn>((context, state) {
                GoRouter.of(context).replaceNamed(profile);
              }),
            ],
          );
        },
      ),
      GoRoute(
        path: profile,
        name: profile,
        builder: (context, state) {
          return ui.ProfileScreen(
            providers: [
              ui.EmailAuthProvider(),
            ],
            actions: [
              ui.SignedOutAction((context) {
                GoRouter.of(context).replaceNamed(signin);
              }),
            ],
          );
        },
      ),
    ],
  );
}

class GoRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('[GoRouter] didPush: $route');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('[GoRouter] didPop: $route');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('[GoRouter] didRemove: $route');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    print('[GoRouter] didReplace: $newRoute');
  }
}
