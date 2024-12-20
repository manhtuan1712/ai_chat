import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuei_ai_chat/core/base/widget/base_app_bar_widget.dart';
import 'package:shuei_ai_chat/core/helpers/app_utils.dart';
import 'package:shuei_ai_chat/core/navigation/navigation_center.dart';
import 'package:shuei_ai_chat/core/provider/app_provider.dart';
import 'package:shuei_ai_chat/feature/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:shuei_ai_chat/feature/home/presentation/cubit/home_recommend_cubit.dart';
import 'package:shuei_ai_chat/feature/home/presentation/widget/ai_agent_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool _isGrid = false;

  var _aiAgents = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        HomeRecommendCubit homeRecommendCubit =
            context.read<HomeRecommendCubit>();
        Future.delayed(
          const Duration(
            milliseconds: 200,
          ),
          () {
            homeRecommendCubit.getRecommendAgentAction(
              {},
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBarWidget(
        isFavorite: false,
        isGrid: _isGrid,
        changeStyle: () {
          _isGrid = !_isGrid;
          setState(() {});
        },
        changeFilter: () =>
            context.read<HomeRecommendCubit>().getRecommendAgentAction(
                  context.read<AppProvider>().getFilter(
                        false,
                      ),
                ),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<HomeRecommendCubit, HomeRecommendState>(
            listener: (context, state) {
              if (state is HomeRecommendSuccessState) {
                _aiAgents = state.aiAgents ?? [];
                setState(() {});
              } else if (state is HomeRecommendFailureState) {
                AppUtils.showToastMessage(
                  state.error ?? '',
                  context,
                );
              }
            },
          ),
          BlocListener<FavoriteCubit, FavoriteState>(
            listener: (context, state) {
              if (state is AddFavoriteSuccessState) {
                _aiAgents
                    .firstWhere(
                      (e) => e.id == state.agent!.id,
                    )
                    .favorite = true;
                setState(() {});
              } else if (state is RemoveFavoriteSuccessState) {
                _aiAgents
                    .firstWhere(
                      (e) => e.id == state.agentId,
                    )
                    .favorite = false;
                setState(() {});
              }
            },
          ),
        ],
        child: RefreshIndicator(
          onRefresh: () async =>
              context.read<HomeRecommendCubit>().getRecommendAgentAction(
                    context.read<AppProvider>().getFilter(false),
                  ),
          child: _isGrid
              ? GridView.builder(
                  primary: false,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    childAspectRatio: 0.77,
                  ),
                  padding: const EdgeInsets.all(
                    16.0,
                  ),
                  itemCount: _aiAgents.length,
                  itemBuilder: (context, index) {
                    return AIAGentCardWidget(
                      _aiAgents[index],
                      NavigationCenter.homeScreen,
                      imageWidth: MediaQuery.sizeOf(context).width * .5,
                      isGrid: true,
                    );
                  },
                )
              : ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: _aiAgents.length,
                  padding: const EdgeInsets.all(
                    16.0,
                  ),
                  itemBuilder: (context, index) {
                    return AIAGentCardWidget(
                      _aiAgents[index],
                      NavigationCenter.homeScreen,
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
