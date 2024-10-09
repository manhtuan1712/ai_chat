import 'package:flutter/material.dart';
import 'package:shuei_ai_chat/core/helpers/app_utils.dart';
import 'package:shuei_ai_chat/core/helpers/event_bus.dart';
import 'package:shuei_ai_chat/feature/main/presentation/widget/app_bottom_bar.dart';
import 'package:shuei_ai_chat/feature/main/presentation/widget/tab_navigator.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  NaviTabItem _currentTab = NaviTabItem.home;

  final Map<NaviTabItem, GlobalKey<NavigatorState>> _navigatorKeys = {
    NaviTabItem.home: GlobalKey<NavigatorState>(),
    NaviTabItem.favorite: GlobalKey<NavigatorState>(),
    NaviTabItem.message: GlobalKey<NavigatorState>(),
    NaviTabItem.profile: GlobalKey<NavigatorState>(),
  };

  void _tabSelected(int newIndex) {
    FocusScope.of(context).unfocus();
    if (!mounted) return;
    NaviTabItem tabItem = newIndex == 0
        ? NaviTabItem.home
        : (newIndex == 1
            ? NaviTabItem.favorite
            : newIndex == 2
                ? NaviTabItem.message
                : NaviTabItem.profile);
    if (tabItem == _currentTab) {
      _navigatorKeys[tabItem]!.currentState!.popUntil(
            (route) => route.isFirst,
          );
    } else {
      setState(() {
        _currentTab = tabItem;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    eventBus.on<GoToFavoriteEvent>().listen(
      (event) {
        _tabSelected(
          1,
        );
        _navigatorKeys[_currentTab]!.currentState!.popUntil(
              (route) => route.isFirst,
            );
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildTabContent(),
        AppBottomBar(
          _currentTab,
          onTap: _tabSelected,
        ),
      ],
    );
  }

  Widget _buildTabContent() {
    return Padding(
      padding: EdgeInsets.only(
        bottom: AppUtils.getBottomBarHeight(),
      ),
      child: Stack(
        children: <Widget>[
          _buildOffstageNavigator(
            NaviTabItem.home,
            ScrollController(),
          ),
          _buildOffstageNavigator(
            NaviTabItem.favorite,
            ScrollController(),
          ),
          _buildOffstageNavigator(
            NaviTabItem.message,
            ScrollController(),
          ),
          _buildOffstageNavigator(
            NaviTabItem.profile,
            ScrollController(),
          ),
        ],
      ),
    );
  }

  Widget _buildOffstageNavigator(
    NaviTabItem tabItem,
    ScrollController scrollController,
  ) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
        scrollController: scrollController,
      ),
    );
  }
}
