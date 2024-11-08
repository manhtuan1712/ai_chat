import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuei_ai_chat/core/base/widget/base_app_bar_widget.dart';
import 'package:shuei_ai_chat/core/base/widget/base_require_login_widget.dart';
import 'package:shuei_ai_chat/core/helpers/app_utils.dart';
import 'package:shuei_ai_chat/core/navigation/navigation_center.dart';
import 'package:shuei_ai_chat/core/provider/app_provider.dart';
import 'package:shuei_ai_chat/feature/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:shuei_ai_chat/feature/home/data/model/ai_agent_model.dart';
import 'package:shuei_ai_chat/feature/home/presentation/widget/ai_agent_card_widget.dart';
import 'package:shuei_ai_chat/generated/l10n.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  FavoriteScreenState createState() => FavoriteScreenState();
}

class FavoriteScreenState extends State<FavoriteScreen> {
  bool _isGrid = false;

  final List<AIAgentModel> _favorites = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        FavoriteCubit favoriteCubit = context.read<FavoriteCubit>();
        Future.delayed(
          const Duration(
            milliseconds: 200,
          ),
          () {
            if (AppUtils.isLogin) {
              favoriteCubit.getFavoritesAction();
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBarWidget(
        isFavorite: true,
        isGrid: _isGrid,
        changeStyle: () {
          _isGrid = !_isGrid;
          setState(() {});
        },
        changeFilter: () {},
        title: S.of(context).favoriteTitle,
      ),
      body: context.watch<AppProvider>().accessToken.isEmpty
          ? const BaseRequireLoginWidget()
          : BlocListener<FavoriteCubit, FavoriteState>(
              listener: (context, state) {
                if (state is GetFavoriteSuccessState) {
                  _favorites.clear();
                  _favorites.addAll(
                    state.favorites ?? [],
                  );
                  for (var element in _favorites) {
                    element.favorite = true;
                  }
                  setState(() {});
                } else if (state is AddFavoriteSuccessState) {
                  _favorites.add(
                    state.agent!,
                  );
                  setState(() {});
                } else if (state is RemoveFavoriteSuccessState) {
                  _favorites.removeWhere(
                    (e) => e.agentId == state.agentId,
                  );
                  setState(() {});
                }
              },
              child: RefreshIndicator(
                onRefresh: () async =>
                    context.read<FavoriteCubit>().getFavoritesAction(),
                child: _isGrid
                    ? GridView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                          childAspectRatio: 0.77,
                        ),
                        padding: const EdgeInsets.all(
                          16.0,
                        ),
                        itemCount: _favorites.length,
                        itemBuilder: (context, index) {
                          return AIAGentCardWidget(
                            _favorites[index],
                            NavigationCenter.favoriteScreen,
                            imageWidth: MediaQuery.sizeOf(context).width * .5,
                          );
                        },
                      )
                    : ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        primary: false,
                        shrinkWrap: true,
                        itemCount: _favorites.length,
                        padding: const EdgeInsets.all(
                          16.0,
                        ),
                        itemBuilder: (context, index) {
                          return AIAGentCardWidget(
                            _favorites[index],
                            NavigationCenter.favoriteScreen,
                            imageWidth: MediaQuery.sizeOf(context).width,
                            isGrid: false,
                          );
                        },
                      ),
              ),
            ),
    );
  }
}
