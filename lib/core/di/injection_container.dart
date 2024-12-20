import 'package:get_it/get_it.dart';
import 'package:shuei_ai_chat/core/api/service/base/base_rest_service.dart';
import 'package:shuei_ai_chat/core/helpers/secure_storage.dart';
import 'package:shuei_ai_chat/core/provider/app_provider.dart';
import 'package:shuei_ai_chat/core/theme/theme_style.dart';
import 'package:shuei_ai_chat/feature/authentication/data/datasource/authentication_remote_data_source.dart';
import 'package:shuei_ai_chat/feature/authentication/data/repository/authentication_repository_impl.dart';
import 'package:shuei_ai_chat/feature/authentication/domain/repository/authentication_repository.dart';
import 'package:shuei_ai_chat/feature/authentication/domain/usecase/post_auth.dart';
import 'package:shuei_ai_chat/feature/authentication/domain/usecase/post_sign_up.dart';
import 'package:shuei_ai_chat/feature/authentication/presentation/cubit/login_cubit.dart';
import 'package:shuei_ai_chat/feature/authentication/presentation/cubit/sign_up_cubit.dart';
import 'package:shuei_ai_chat/feature/chat/data/datasource/chat_remote_data_source.dart';
import 'package:shuei_ai_chat/feature/chat/data/repository/chat_repository_impl.dart';
import 'package:shuei_ai_chat/feature/chat/domain/repository/chat_repository.dart';
import 'package:shuei_ai_chat/feature/chat/domain/usecase/get_agent_chat_history.dart';
import 'package:shuei_ai_chat/feature/chat/domain/usecase/get_chat_history.dart';
import 'package:shuei_ai_chat/feature/chat/domain/usecase/send_message.dart';
import 'package:shuei_ai_chat/feature/chat/domain/usecase/send_voice_message.dart';
import 'package:shuei_ai_chat/feature/chat/presentation/cubit/chat_detail_cubit.dart';
import 'package:shuei_ai_chat/feature/chat/presentation/cubit/chat_list_cubit.dart';
import 'package:shuei_ai_chat/feature/favorite/data/datasource/favorite_remote_data_source.dart';
import 'package:shuei_ai_chat/feature/favorite/data/repository/favorite_repository_impl.dart';
import 'package:shuei_ai_chat/feature/favorite/domain/repository/favorite_repository.dart';
import 'package:shuei_ai_chat/feature/favorite/domain/usecase/add_favorite.dart';
import 'package:shuei_ai_chat/feature/favorite/domain/usecase/get_favorites.dart';
import 'package:shuei_ai_chat/feature/favorite/domain/usecase/remove_favorite.dart';
import 'package:shuei_ai_chat/feature/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:shuei_ai_chat/feature/home/data/datasource/home_remote_data_source.dart';
import 'package:shuei_ai_chat/feature/home/data/repository/home_repository_impl.dart';
import 'package:shuei_ai_chat/feature/home/domain/repository/home_repository.dart';
import 'package:shuei_ai_chat/feature/home/domain/usecase/get_list_ages.dart';
import 'package:shuei_ai_chat/feature/home/domain/usecase/get_list_genders.dart';
import 'package:shuei_ai_chat/feature/home/domain/usecase/get_list_hobbies.dart';
import 'package:shuei_ai_chat/feature/home/domain/usecase/get_list_occupation.dart';
import 'package:shuei_ai_chat/feature/home/domain/usecase/get_recommend_agent.dart';
import 'package:shuei_ai_chat/feature/home/presentation/cubit/home_filter_cubit.dart';
import 'package:shuei_ai_chat/feature/home/presentation/cubit/home_recommend_cubit.dart';
import 'package:shuei_ai_chat/feature/profile/data/datasource/profile_remote_data_source.dart';
import 'package:shuei_ai_chat/feature/profile/data/repository/profile_repository_impl.dart';
import 'package:shuei_ai_chat/feature/profile/domain/repository/profile_repository.dart';
import 'package:shuei_ai_chat/feature/profile/domain/usecase/change_password.dart';
import 'package:shuei_ai_chat/feature/profile/domain/usecase/get_profile.dart';
import 'package:shuei_ai_chat/feature/profile/domain/usecase/update_profile.dart';
import 'package:shuei_ai_chat/feature/profile/presentation/cubit/profile_cubit.dart';

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
  sl.registerLazySingleton<FavoriteRemoteDataSource>(
    () => FavoriteRemoteDataSourceImpl(
      baseRestService: sl(),
    ),
  );
  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(
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
  sl.registerLazySingleton<FavoriteRepository>(
    () => FavoriteRepositoryImpl(
      favoriteRemoteDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      profileRemoteDataSource: sl(),
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
  sl.registerLazySingleton<PostSignUp>(
    () => PostSignUp(
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
  sl.registerLazySingleton<GetFavorites>(
    () => GetFavorites(
      favoriteRepository: sl(),
    ),
  );
  sl.registerLazySingleton<AddFavorite>(
    () => AddFavorite(
      favoriteRepository: sl(),
    ),
  );
  sl.registerLazySingleton<RemoveFavorite>(
    () => RemoveFavorite(
      favoriteRepository: sl(),
    ),
  );
  sl.registerLazySingleton<ChangePassword>(
    () => ChangePassword(
      profileRepository: sl(),
    ),
  );
  sl.registerLazySingleton<GetProfile>(
    () => GetProfile(
      profileRepository: sl(),
    ),
  );
  sl.registerLazySingleton<UpdateProfile>(
    () => UpdateProfile(
      profileRepository: sl(),
    ),
  );
  sl.registerLazySingleton<GetListGenders>(
    () => GetListGenders(
      homeRepository: sl(),
    ),
  );
  sl.registerLazySingleton<GetListAges>(
    () => GetListAges(
      homeRepository: sl(),
    ),
  );
  sl.registerLazySingleton<GetListHobbies>(
    () => GetListHobbies(
      homeRepository: sl(),
    ),
  );
  sl.registerLazySingleton<GetListOccupation>(
    () => GetListOccupation(
      homeRepository: sl(),
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
  sl.registerFactory<HomeFilterCubit>(
    () => HomeFilterCubit(
      getListGenders: sl(),
      getListAges: sl(),
      getListHobbies: sl(),
      getListOccupation: sl(),
    ),
  );
  sl.registerFactory<LoginCubit>(
    () => LoginCubit(
      postAuth: sl(),
    ),
  );
  sl.registerFactory<SignUpCubit>(
    () => SignUpCubit(
      postSignUp: sl(),
    ),
  );
  sl.registerFactory<FavoriteCubit>(
    () => FavoriteCubit(
      getFavorites: sl(),
      addFavorite: sl(),
      removeFavorite: sl(),
    ),
  );
  sl.registerFactory<ProfileCubit>(
    () => ProfileCubit(
      changePassword: sl(),
      getProfile: sl(),
      updateProfile: sl(),
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
