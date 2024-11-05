part of 'home_filter_cubit.dart';

@immutable
abstract class HomeFilterState {}

class HomeFilterInitialState extends HomeFilterState {}

class HomeFilterLoadingState extends HomeFilterState {}

class GetListAgesSuccessState extends HomeFilterState {
  final List<AttributeAgeFilterModel>? ages;

  GetListAgesSuccessState({
    this.ages,
  });
}

class GetListGendersSuccessState extends HomeFilterState {
  final List<AttributeFilterModel>? genders;

  GetListGendersSuccessState({
    this.genders,
  });
}

class GetListHobbiesSuccessState extends HomeFilterState {
  final List<AttributeFilterModel>? hobbies;

  GetListHobbiesSuccessState({
    this.hobbies,
  });
}

class GetListOccupationSuccessState extends HomeFilterState {
  final List<AttributeFilterModel>? occupation;

  GetListOccupationSuccessState({
    this.occupation,
  });
}
