import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuei_ai_chat/core/usecase/usecase.dart';
import 'package:shuei_ai_chat/feature/home/data/model/attribute_age_filter_model.dart';
import 'package:shuei_ai_chat/feature/home/data/model/attribute_filter_model.dart';
import 'package:shuei_ai_chat/feature/home/domain/usecase/get_list_ages.dart';
import 'package:shuei_ai_chat/feature/home/domain/usecase/get_list_genders.dart';
import 'package:shuei_ai_chat/feature/home/domain/usecase/get_list_hobbies.dart';
import 'package:shuei_ai_chat/feature/home/domain/usecase/get_list_occupation.dart';

part 'home_filter_state.dart';

class HomeFilterCubit extends Cubit<HomeFilterState> {
  GetListAges getListAges;

  GetListOccupation getListOccupation;

  GetListHobbies getListHobbies;

  GetListGenders getListGenders;

  HomeFilterCubit({
    required this.getListAges,
    required this.getListGenders,
    required this.getListHobbies,
    required this.getListOccupation,
  }) : super(HomeFilterInitialState());

  Future<void> getListAgesAction() async {
    emit(
      HomeFilterLoadingState(),
    );
    final result = await getListAges(
      NoParams(),
    );
    result.fold(
      (l) {},
      (r) {
        emit(
          GetListAgesSuccessState(
            ages: r,
          ),
        );
      },
    );
  }

  Future<void> getListGendersAction() async {
    emit(
      HomeFilterLoadingState(),
    );
    final result = await getListGenders(
      NoParams(),
    );
    result.fold(
      (l) {},
      (r) {
        emit(
          GetListGendersSuccessState(
            genders: r,
          ),
        );
      },
    );
  }

  Future<void> getListHobbiesAction() async {
    emit(
      HomeFilterLoadingState(),
    );
    final result = await getListHobbies(
      NoParams(),
    );
    result.fold(
      (l) {},
      (r) {
        emit(
          GetListHobbiesSuccessState(
            hobbies: r,
          ),
        );
      },
    );
  }

  Future<void> getListOccupationAction() async {
    emit(
      HomeFilterLoadingState(),
    );
    final result = await getListOccupation(
      NoParams(),
    );
    result.fold(
      (l) {},
      (r) {
        emit(
          GetListOccupationSuccessState(
            occupation: r,
          ),
        );
      },
    );
  }
}
