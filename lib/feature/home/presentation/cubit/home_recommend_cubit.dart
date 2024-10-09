import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuei_ai_chat/core/usecase/usecase.dart';
import 'package:shuei_ai_chat/feature/home/data/model/ai_agent_model.dart';
import 'package:shuei_ai_chat/feature/home/domain/usecase/get_recommend_agent.dart';

part 'home_recommend_state.dart';

class HomeRecommendCubit extends Cubit<HomeRecommendState> {
  GetRecommendAgent getRecommendAgent;

  HomeRecommendCubit({
    required this.getRecommendAgent,
  }) : super(HomeRecommendInitialState());

  Future<void> getRecommendAgentAction() async {
    emit(
      HomeRecommendLoadingState(),
    );
    final result = await getRecommendAgent(
      NoParams(),
    );
    result.fold(
      (l) {
        emit(
          HomeRecommendFailureState(
            error: l.mess,
          ),
        );
      },
      (r) {
        emit(
          HomeRecommendSuccessState(
            aiAgents: r,
          ),
        );
      },
    );
  }
}
