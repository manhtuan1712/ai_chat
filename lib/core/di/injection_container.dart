import 'package:get_it/get_it.dart';
import 'package:shuei_ai_chat/core/api/service/base/base_rest_service.dart';
import 'package:shuei_ai_chat/core/helpers/secure_storage.dart';
import 'package:shuei_ai_chat/core/provider/app_provider.dart';
import 'package:shuei_ai_chat/core/theme/theme_style.dart';
import 'package:shuei_ai_chat/feature/authentication/data/datasource/authentication_remote_data_source.dart';
import 'package:shuei_ai_chat/feature/authentication/data/repository/authentication_repository_impl.dart';
import 'package:shuei_ai_chat/feature/authentication/domain/repository/authentication_repository.dart';
import 'package:shuei_ai_chat/feature/authentication/domain/usecase/post_auth.dart';
import 'package:shuei_ai_chat/feature/authentication/presentation/cubit/login_cubit.dart';
import 'package:shuei_ai_chat/feature/chat/data/datasource/chat_remote_data_source.dart';
import 'package:shuei_ai_chat/feature/chat/data/repository/chat_repository_impl.dart';
import 'package:shuei_ai_chat/feature/chat/domain/repository/chat_repository.dart';
import 'package:shuei_ai_chat/feature/chat/domain/usecase/get_agent_chat_history.dart';
import 'package:shuei_ai_chat/feature/chat/domain/usecase/get_chat_history.dart';
import 'package:shuei_ai_chat/feature/chat/domain/usecase/send_message.dart';
import 'package:shuei_ai_chat/feature/chat/domain/usecase/send_voice_message.dart';
import 'package:shuei_ai_chat/feature/chat/presentation/cubit/chat_detail_cubit.dart';
import 'package:shuei_ai_chat/feature/chat/presentation/cubit/chat_list_cubit.dart';
import 'package:shuei_ai_chat/feature/home/data/datasource/home_remote_data_source.dart';
import 'package:shuei_ai_chat/feature/home/data/repository/home_repository_impl.dart';
import 'package:shuei_ai_chat/feature/home/domain/repository/home_repository.dart';
import 'package:shuei_ai_chat/feature/home/domain/usecase/get_recommend_agent.dart';
import 'package:shuei_ai_chat/feature/home/presentation/cubit/home_recommend_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Data source
  sl.registerLazySingleton<ChatRemoteDataSource>(
    () => ChatRemoteDataSourceImpl(
      baseRestService: sl(),
    ),
  );
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(
      baseRestService: sl(),
    ),
  );
  sl.registerLazySingleton<AuthenticationRemoteDataSource>(
    () => AuthenticationRemoteDataSourceImpl(
      baseRestService: sl(),
    ),
  );

  // Repository
  sl.registerLazySingleton<ChatRepository>(
    () => ChatRepositoryImpl(
      chatRemoteDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      homeRemoteDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      authenticationRemoteDataSource: sl(),
    ),
  );

  // Use case
  sl.registerLazySingleton<GetRecommendAgent>(
    () => GetRecommendAgent(
      homeRepository: sl(),
    ),
  );
  sl.registerLazySingleton<PostAuth>(
    () => PostAuth(
      authenticationRepository: sl(),
    ),
  );
  sl.registerLazySingleton<GetChatHistory>(
    () => GetChatHistory(
      chatRepository: sl(),
    ),
  );
  sl.registerLazySingleton<GetAgentChatHistory>(
    () => GetAgentChatHistory(
      chatRepository: sl(),
    ),
  );
  sl.registerLazySingleton<SendMessage>(
    () => SendMessage(
      chatRepository: sl(),
    ),
  );
  sl.registerLazySingleton<SendVoiceMessage>(
    () => SendVoiceMessage(
      chatRepository: sl(),
    ),
  );

  // Cubit
  sl.registerFactory<ChatListCubit>(
    () => ChatListCubit(
      getChatHistory: sl(),
    ),
  );
  sl.registerFactory<ChatDetailCubit>(
    () => ChatDetailCubit(
      getAgentChatHistory: sl(),
      sendMessage: sl(),
      sendVoiceMessage: sl(),
    ),
  );
  sl.registerFactory<HomeRecommendCubit>(
    () => HomeRecommendCubit(
      getRecommendAgent: sl(),
    ),
  );
  sl.registerFactory<LoginCubit>(
    () => LoginCubit(
      postAuth: sl(),
    ),
  );

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
  sl.registerLazySingleton<AppProvider>(
    () => AppProvider(),
  );
}
