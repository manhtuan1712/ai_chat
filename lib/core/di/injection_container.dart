import 'package:get_it/get_it.dart';
import 'package:shuei_ai_chat/core/api/service/base/base_rest_service.dart';
import 'package:shuei_ai_chat/core/helpers/secure_storage.dart';
import 'package:shuei_ai_chat/core/theme/theme_style.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Data source

  // Use case

  // Cubit

  // Services
  sl.registerLazySingleton<BaseRestService>(
    () => BaseRestService(),
  );

  // Other
  sl.registerLazySingleton<ThemeStyle>(
    () => ThemeStyle(),
  );
  sl.registerFactory<SecureStorage>(
    () => SecureStorage(),
  );
}
