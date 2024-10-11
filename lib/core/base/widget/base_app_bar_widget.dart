import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shuei_ai_chat/core/helpers/app_constants.dart';
import 'package:shuei_ai_chat/core/helpers/app_utils.dart';
import 'package:shuei_ai_chat/feature/home/presentation/widget/home_filter_widget.dart';

class BaseAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Function changeStyle;

  final Function changeFilter;

  final bool isGrid;

  final String title;

  const BaseAppBarWidget({
    super.key,
    required this.changeFilter,
    required this.changeStyle,
    required this.isGrid,
    this.title = '',
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppConstants.textHeadingH5.copyWith(
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      leading: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => changeStyle.call(),
        child: Padding(
          padding: const EdgeInsets.all(
            12.0,
          ),
          child: SvgPicture.asset(
            isGrid ? AppConstants.icHomeList : AppConstants.icHomeGrid,
            width: 33.0,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              isDismissible: true,
              backgroundColor: Colors.transparent,
              context: AppUtils.contextMain,
              builder: (context) {
                return const FractionallySizedBox(
                  heightFactor: .9,
                  child: HomeFilterWidget(),
                );
              },
            );
          },
          child: Container(
            margin: const EdgeInsets.only(
              right: 4.0,
            ),
            child: Padding(
              padding: const EdgeInsets.all(
                8.0,
              ),
              child: SvgPicture.asset(
                AppConstants.icFilter,
                width: 33.0,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(
        56.0,
      );
}