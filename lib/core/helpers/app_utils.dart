import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shuei_ai_chat/core/di/injection_container.dart' as di;
import 'package:shuei_ai_chat/core/helpers/secure_storage.dart';
import 'package:shuei_ai_chat/core/navigation/navigation_center.dart';
import 'package:shuei_ai_chat/core/theme/app_colors.dart';

class AppUtils {
  static BuildContext get contextMain =>
      NavigationCenter.navigatorKey.currentContext!;

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await di.init();
    await di.sl<SecureStorage>().init();
  }

  static showToastMessage(
    String message,
    BuildContext context,
  ) {
    if (message.isNotEmpty) {
      Future.delayed(
        const Duration(milliseconds: 200),
        () {
          Fluttertoast.showToast(
            msg: message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 2,
            backgroundColor: AppColors.light.colorGrey10,
            textColor: AppColors.light.colorTextPrimary,
          );
        },
      );
    }
  }

  static double getBottomBarHeight() =>
      42.0 + MediaQuery.paddingOf(contextMain).bottom + 18.0;
}
