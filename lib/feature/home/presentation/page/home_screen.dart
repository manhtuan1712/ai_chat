import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shuei_ai_chat/core/helpers/app_constants.dart';
import 'package:shuei_ai_chat/core/helpers/app_utils.dart';
import 'package:shuei_ai_chat/feature/home/presentation/cubit/home_recommend_cubit.dart';
import 'package:shuei_ai_chat/feature/home/presentation/widget/ai_agent_card_widget.dart';
import 'package:shuei_ai_chat/feature/home/presentation/widget/home_filter_widget.dart';

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
      appBar: AppBar(
        leading: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            _isGrid = !_isGrid;
            setState(() {});
          },
          child: Padding(
            padding: const EdgeInsets.all(
              12.0,
            ),
            child: SvgPicture.asset(
              _isGrid ? AppConstants.icHomeList : AppConstants.icHomeGrid,
              width: 33.0,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        actions: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                isDismissible: true,
                backgroundColor: Colors.transparent,
                context: AppUtils.contextMain,
                builder: (context) {
                  return const FractionallySizedBox(
                    heightFactor: .9,
                    child: HomeFilterWidget(),
                  );
                },
              );
            },
            child: Container(
              margin: const EdgeInsets.only(
                right: 4.0,
              ),
              child: Padding(
                padding: const EdgeInsets.all(
                  8.0,
                ),
                child: SvgPicture.asset(
                  AppConstants.icFilter,
                  width: 33.0,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
        ],
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
                    childAspectRatio: 0.48,
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
