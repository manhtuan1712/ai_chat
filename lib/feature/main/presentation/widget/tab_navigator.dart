import 'package:flutter/material.dart';
import 'package:shuei_ai_chat/feature/chat/presentation/page/chat_list_screen.dart';
import 'package:shuei_ai_chat/feature/favorite/presentation/page/favorite_screen.dart';
import 'package:shuei_ai_chat/feature/home/presentation/page/home_screen.dart';
import 'package:shuei_ai_chat/feature/main/presentation/page/main_screen.dart';
import 'package:shuei_ai_chat/feature/profile/presentation/page/profile_screen.dart';

class TabNavigatorRoutes {
  static const String root = '/';
}

class TabNavigator extends StatelessWidget {
  const TabNavigator({
    super.key,
    this.navigatorKey,
    this.tabItem,
    this.scrollController,
  });

  final GlobalKey<NavigatorState>? navigatorKey;

  final NaviTabItem? tabItem;

  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) {
            if (tabItem == NaviTabItem.home) {
              return const HomeScreen();
            } else if (tabItem == NaviTabItem.favorite) {
              return const FavoriteScreen();
            } else if (tabItem == NaviTabItem.message) {
              return const ChatListScreen();
            }
            return const ProfileScreen();
          },
        );
      },
    );
  }
}
