import 'package:get_it/get_it.dart';
import 'package:shuei_ai_chat/core/api/service/base/base_rest_service.dart';
import 'package:shuei_ai_chat/core/helpers/secure_storage.dart';
import 'package:shuei_ai_chat/core/provider/app_provider.dart';
import 'package:shuei_ai_chat/core/theme/theme_style.dart';
import 'package:shuei_ai_chat/feature/chat/data/datasource/chat_remote_data_source.dart';
import 'package:shuei_ai_chat/feature/chat/data/repository/chat_repository_impl.dart';
import 'package:shuei_ai_chat/feature/chat/domain/repository/chat_repository.dart';
import 'package:shuei_ai_chat/feature/chat/domain/usecase/get_conversations.dart';
import 'package:shuei_ai_chat/feature/chat/domain/usecase/get_messages.dart';
import 'package:shuei_ai_chat/feature/chat/domain/usecase/get_parameters.dart';
import 'package:shuei_ai_chat/feature/chat/domain/usecase/get_voice.dart';
import 'package:shuei_ai_chat/feature/chat/domain/usecase/init_chat_stream.dart';
import 'package:shuei_ai_chat/feature/chat/domain/usecase/post_message_case.dart';
import 'package:shuei_ai_chat/feature/chat/domain/usecase/rename_conversation.dart';
import 'package:shuei_ai_chat/feature/chat/domain/usecase/update_conversation_name.dart';
import 'package:shuei_ai_chat/feature/chat/presentation/cubit/chat_detail_cubit.dart';
import 'package:shuei_ai_chat/feature/chat/presentation/cubit/chat_list_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Data source
  sl.registerLazySingleton<ChatRemoteDataSource>(
    () => ChatRemoteDataSourceImpl(
      baseRestService: sl(),
    ),
  );

  // Repository
  sl.registerLazySingleton<ChatRepository>(
    () => ChatRepositoryImpl(
      chatRemoteDataSource: sl(),
    ),
  );

  // Use case
  sl.registerLazySingleton<GetParameters>(
    () => GetParameters(
      chatRepository: sl(),
    ),
  );
  sl.registerLazySingleton<GetConversations>(
    () => GetConversations(
      chatRepository: sl(),
    ),
  );
  sl.registerLazySingleton<InitChatStream>(
    () => InitChatStream(
      chatRepository: sl(),
    ),
  );
  sl.registerLazySingleton<UpdateConversationName>(
    () => UpdateConversationName(
      chatRepository: sl(),
    ),
  );
  sl.registerLazySingleton<GetMessages>(
    () => GetMessages(
      chatRepository: sl(),
    ),
  );
  sl.registerLazySingleton<RenameConversation>(
    () => RenameConversation(
      chatRepository: sl(),
    ),
  );
  sl.registerLazySingleton<PostMessage>(
    () => PostMessage(
      chatRepository: sl(),
    ),
  );
  sl.registerLazySingleton<GetVoice>(
    () => GetVoice(
      chatRepository: sl(),
    ),
  );

  // Cubit
  sl.registerFactory<ChatListCubit>(
    () => ChatListCubit(
      getParameters: sl(),
      getConversations: sl(),
      renameConversation: sl(),
    ),
  );
  sl.registerFactory<ChatDetailCubit>(
    () => ChatDetailCubit(
      initChatStream: sl(),
      updateConversationName: sl(),
      getMessages: sl(),
      postMessage: sl(),
      getVoice: sl(),
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
