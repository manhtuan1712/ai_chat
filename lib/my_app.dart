import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shuei_ai_chat/core/di/injection_container.dart';
import 'package:shuei_ai_chat/core/helpers/global_configs.dart';
import 'package:shuei_ai_chat/core/navigation/navigation_center.dart';
import 'package:shuei_ai_chat/core/provider/app_provider.dart';
import 'package:shuei_ai_chat/core/theme/theme_style.dart';
import 'package:shuei_ai_chat/feature/chat/presentation/cubit/chat_list_cubit.dart';
import 'package:shuei_ai_chat/feature/chat/presentation/page/chat_list_screen.dart';
import 'package:shuei_ai_chat/generated/l10n.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppProvider>(
          create: (_) => sl<AppProvider>(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => sl<ChatListCubit>(),
          ),
        ],
        child: MaterialApp(
          navigatorKey: NavigationCenter.navigatorKey,
          title: '',
          builder: EasyLoading.init(),
          theme: ThemeStyle.lightTheme,
          darkTheme: ThemeStyle.darkTheme,
          debugShowCheckedModeBanner: false,
          locale: Platform.localeName.isEmpty
              ? const Locale(GlobalConfig.languageEn)
              : Locale(Platform.localeName),
          showPerformanceOverlay: false,
          showSemanticsDebugger: false,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          onGenerateRoute: NavigationCenter.generateRoute,
          home: const ChatListScreen(),
        ),
      ),
    );
  }
}
