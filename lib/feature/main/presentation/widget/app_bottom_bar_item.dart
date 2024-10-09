import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBottomBarItem extends StatelessWidget {
  final bool isActive;

  final String icActive;

  final String icInactive;

  const AppBottomBarItem({
    super.key,
    required this.isActive,
    required this.icActive,
    required this.icInactive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 2.0,
        ),
        SvgPicture.asset(
          isActive ? icActive : icInactive,
          fit: BoxFit.contain,
          alignment: Alignment.center,
        ),
      ],
    );
  }
}
