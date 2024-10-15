part of 'favorite_cubit.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitialState extends FavoriteState {}

class FavoriteLoadingState extends FavoriteState {}

class GetFavoriteSuccessState extends FavoriteState {
  final List<AIAgentModel>? favorites;

  GetFavoriteSuccessState({
    this.favorites,
  });
}

class GetFavoriteFailureState extends FavoriteState {
  final String? error;

  GetFavoriteFailureState({
    this.error,
  });
}

class AddFavoriteSuccessState extends FavoriteState {
  final AIAgentModel? agent;

  AddFavoriteSuccessState({
    this.agent,
  });
}

class AddFavoriteFailureState extends FavoriteState {
  final String? error;

  AddFavoriteFailureState({
    this.error,
  });
}

class RemoveFavoriteSuccessState extends FavoriteState {
  final String? agentId;

  RemoveFavoriteSuccessState({
    this.agentId,
  });
}

class RemoveFavoriteFailureState extends FavoriteState {
  final String? error;

  RemoveFavoriteFailureState({
    this.error,
  });
}
