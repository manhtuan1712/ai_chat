import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuei_ai_chat/core/base/widget/base_app_bar_widget.dart';
import 'package:shuei_ai_chat/core/helpers/app_utils.dart';
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
        context.read<HomeRecommendCubit>().getRecommendAgentAction();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBarWidget(
        isGrid: _isGrid,
        changeStyle: () {
          _isGrid = !_isGrid;
          setState(() {});
        },
        changeFilter: () {},
      ),
      body: BlocListener<HomeRecommendCubit, HomeRecommendState>(
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
        child: RefreshIndicator(
          onRefresh: () async =>
              context.read<HomeRecommendCubit>().getRecommendAgentAction(),
          child: _isGrid
              ? GridView.builder(
                  primary: false,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    childAspectRatio: 0.8,
                  ),
                  padding: const EdgeInsets.all(
                    16.0,
                  ),
                  itemCount: _aiAgents.length,
                  itemBuilder: (context, index) {
                    return AIAGentCardWidget(
                      _aiAgents[index],
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
