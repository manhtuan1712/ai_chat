import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shuei_ai_chat/core/helpers/app_utils.dart';
import 'package:shuei_ai_chat/core/helpers/global_configs.dart';
import 'package:shuei_ai_chat/my_app.dart';

Future<void> main() async {
  return runZonedGuarded(
    () async {
      await AppUtils.init();
      await dotenv.load(
        fileName: GlobalConfig.envPath,
      );
      runApp(
        const MyApp(),
      );
    },
    (error, stack) {
      debugPrint('$stack');
      debugPrint('$error');
    },
  );
}
