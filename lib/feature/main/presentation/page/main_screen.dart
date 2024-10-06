import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shuei_ai_chat/core/helpers/app_constants.dart';
import 'package:shuei_ai_chat/core/helpers/event_bus.dart';
import 'package:shuei_ai_chat/feature/main/presentation/widget/tab_navigator.dart';
import 'package:shuei_ai_chat/generated/l10n.dart';

enum NaviTabItem { home, favorite, message, profile }

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  NaviTabItem _currentTab = NaviTabItem.home;

  int _currentIndex = 0;

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
        _currentIndex = 1;
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildTabContent(),
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        currentIndex: _currentIndex,
        onTap: (i) {
          _tabSelected(i);
          setState(
            () => _currentIndex = i,
          );
        },
        items: [
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.home,
            ),
            title: Text(
              S.of(context).mainHomeBottom,
              style: AppConstants.textBody2Regular,
            ),
            selectedColor: Theme.of(context).colorScheme.primary,
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.favorite,
            ),
            title: Text(
              S.of(context).mainFavoriteBottom,
              style: AppConstants.textBody2Regular,
            ),
            selectedColor: Theme.of(context).colorScheme.primary,
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.chat_bubble,
            ),
            title: Text(
              S.of(context).mainChatBottom,
              style: AppConstants.textBody2Regular,
            ),
            selectedColor: Theme.of(context).colorScheme.primary,
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.person,
            ),
            title: Text(
              S.of(context).mainProfileBottom,
              style: AppConstants.textBody2Regular,
            ),
            selectedColor: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    return Stack(
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
