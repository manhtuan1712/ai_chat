import 'package:flutter/material.dart';

class NavigationCenter {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static const String homeScreen = 'home-screen';
  static const String favoriteScreen = 'favorite-screen';
  static const String chatDetailScreen = 'chat-detail-screen';
  static const String loginScreen = 'login-screen';
  static const String agentDetailScreen = 'agent-detail-screen';
  static const String signUpScreen = 'sign-up-screen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }

  static goToScreen(
    BuildContext context,
    String name,
    Widget screen,
  ) =>
      Navigator.push(
        context,
        MaterialPageRoute(
          settings: RouteSettings(
            name: name,
          ),
          builder: (_) => screen,
        ),
      );
}
