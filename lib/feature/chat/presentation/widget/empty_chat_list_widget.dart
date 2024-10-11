import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shuei_ai_chat/core/helpers/app_constants.dart';
import 'package:shuei_ai_chat/generated/l10n.dart';

class EmptyChatListWidget extends StatelessWidget {
  const EmptyChatListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        32.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppConstants.icRetry,
            width: 200.0,
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            S.of(context).chatListEmpty,
            textAlign: TextAlign.center,
            style: AppConstants.textHeadingH5.copyWith(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
