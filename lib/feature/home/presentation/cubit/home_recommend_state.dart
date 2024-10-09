part of 'home_recommend_cubit.dart';

@immutable
abstract class HomeRecommendState {}

class HomeRecommendInitialState extends HomeRecommendState {}

class HomeRecommendLoadingState extends HomeRecommendState {}

class HomeRecommendSuccessState extends HomeRecommendState {
  final List<AIAgentModel>? aiAgents;

  HomeRecommendSuccessState({
    this.aiAgents,
  });
}

class HomeRecommendFailureState extends HomeRecommendState {
  final String? error;

  HomeRecommendFailureState({
    this.error,
  });
}
