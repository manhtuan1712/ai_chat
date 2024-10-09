import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shuei_ai_chat/core/helpers/app_utils.dart';

import 'app_bottom_bar.dart';

class BottomBar extends StatelessWidget {
  final NaviTabItem? currentIndex;

  final ValueChanged<int>? onTap;

  final List<BottomNavigationBarItem>? items;

  const BottomBar({
    super.key,
    @required this.currentIndex,
    @required this.onTap,
    @required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppUtils.getBottomBarHeight(),
      child: CupertinoTabBar(
        backgroundColor: Colors.white,
        onTap: onTap,
        items: items!,
        border: const Border(
          top: BorderSide(
            color: Colors.transparent,
            width: 0.0, // One physical pixel.
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}
