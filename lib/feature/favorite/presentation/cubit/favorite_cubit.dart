import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuei_ai_chat/core/usecase/usecase.dart';
import 'package:shuei_ai_chat/feature/favorite/domain/usecase/add_favorite.dart';
import 'package:shuei_ai_chat/feature/favorite/domain/usecase/get_favorites.dart';
import 'package:shuei_ai_chat/feature/home/data/model/ai_agent_model.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  GetFavorites getFavorites;

  AddFavorite addFavorite;

  FavoriteCubit({
    required this.getFavorites,
    required this.addFavorite,
  }) : super(FavoriteInitialState());

  Future<void> getFavoritesAction() async {
    emit(
      FavoriteLoadingState(),
    );
    final result = await getFavorites(
      NoParams(),
    );
    result.fold(
      (l) {
        emit(
          GetFavoriteFailureState(
            error: l.mess,
          ),
        );
      },
      (r) {
        emit(
          GetFavoriteSuccessState(
            favorites: r,
          ),
        );
      },
    );
  }

  Future<void> addFavoriteAction(
    String agentId,
  ) async {
    emit(
      FavoriteLoadingState(),
    );
    final result = await addFavorite(
      AddFavoriteParam(
        agentId: agentId,
      ),
    );
    result.fold(
      (l) {
        emit(
          AddFavoriteFailureState(
            error: l.mess,
          ),
        );
      },
      (r) {
        emit(
          AddFavoriteSuccessState(),
        );
      },
    );
  }
}
