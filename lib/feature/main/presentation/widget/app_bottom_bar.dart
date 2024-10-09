import 'package:flutter/material.dart';
import 'package:shuei_ai_chat/core/helpers/app_constants.dart';
import 'package:shuei_ai_chat/core/helpers/app_utils.dart';
import 'package:shuei_ai_chat/feature/main/presentation/widget/app_bottom_bar_item.dart';
import 'package:shuei_ai_chat/feature/main/presentation/widget/bottom_bar.dart';

enum NaviTabItem {
  home,
  favorite,
  message,
  profile,
}

class AppBottomBar extends StatefulWidget {
  final NaviTabItem selectedTab;

  final ValueChanged<int>? onTap;

  const AppBottomBar(
    this.selectedTab, {
    super.key,
    this.onTap,
  });

  @override
  AppBottomBarState createState() => AppBottomBarState();
}

class AppBottomBarState extends State<AppBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: AppUtils.getBottomBarHeight(),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              spreadRadius: 4,
              blurRadius: 6,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: BottomBar(
          currentIndex: widget.selectedTab,
          onTap: widget.onTap,
          items: [
            BottomNavigationBarItem(
              icon: AppBottomBarItem(
                isActive: widget.selectedTab == NaviTabItem.home,
                icActive: AppConstants.icBottomHomeActive,
                icInactive: AppConstants.icBottomHomeInActive,
              ),
            ),
            BottomNavigationBarItem(
              icon: AppBottomBarItem(
                isActive: widget.selectedTab == NaviTabItem.favorite,
                icActive: AppConstants.icBottomFavoriteActive,
                icInactive: AppConstants.icBottomFavoriteInActive,
              ),
            ),
            BottomNavigationBarItem(
              icon: AppBottomBarItem(
                isActive: widget.selectedTab == NaviTabItem.message,
                icActive: AppConstants.icBottomChatActive,
                icInactive: AppConstants.icBottomChatInActive,
              ),
            ),
            BottomNavigationBarItem(
              icon: AppBottomBarItem(
                isActive: widget.selectedTab == NaviTabItem.profile,
                icActive: AppConstants.icBottomProfileActive,
                icInactive: AppConstants.icBottomProfileInActive,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
