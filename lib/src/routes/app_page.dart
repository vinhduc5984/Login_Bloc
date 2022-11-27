import 'package:flutter/material.dart';
import 'package:testsuntech/src/routes/app_routes.dart';
import 'package:testsuntech/src/routes/appnavigator_observer.dart';
import 'package:testsuntech/src/routes/scaffold_wrapper.dart';
import 'package:testsuntech/src/routes/transition_routes.dart';
import 'package:testsuntech/src/ui/authentication/screen/login_screen.dart';
import 'package:testsuntech/src/ui/home/screen/home_screen.dart';

class AppNavigator extends RouteObserver<PageRoute<dynamic>> {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  Route getRoute(RouteSettings settings) {
    Map<String, dynamic>? arguments = _getArguments(settings);

    switch (settings.name) {
      case Routes.HOME:
        return _buildRoute(
          settings,
          const HomeScreen(),
        );

      case Routes.LOGIN:
        return _buildRoute(
          settings,
          const LoginScreen(),
        );
      default:
        return _buildRoute(
          settings,
          const HomeScreen(),
        );
    }
  }

  _buildRoute(
    RouteSettings routeSettings,
    Widget builder,
  ) {
    return AppMaterialPageRoute(
      builder: (context) => ScaffoldWrapper(child: builder),
      settings: routeSettings,
    );
  }

  _getArguments(RouteSettings settings) {
    return settings.arguments;
  }

  static Future push<T>(
    String route, {
    Object? arguments,
  }) {
    return state.pushNamed(route, arguments: arguments);
  }

  static Future pushNamedAndRemoveUntil<T>(
    String route, {
    Object? arguments,
  }) {
    return state.pushNamedAndRemoveUntil(
      route,
      (route) => false,
      arguments: arguments,
    );
  }

  static Future replaceWith<T>(
    String route, {
    Map<String, dynamic>? arguments,
  }) {
    return state.pushReplacementNamed(route, arguments: arguments);
  }

  static void popUntil<T>(String route) {
    state.popUntil(ModalRoute.withName(route));
  }

  static void pop() {
    if (canPop) {
      state.pop();
    }
  }

  static bool get canPop => state.canPop();

  static String? currentRoute() => AppNavigatorObserver.currentRouteName;

  static BuildContext? get context => navigatorKey.currentContext;

  static NavigatorState get state => navigatorKey.currentState!;
}
