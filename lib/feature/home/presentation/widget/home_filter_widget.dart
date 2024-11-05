import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuei_ai_chat/core/provider/app_provider.dart';
import 'package:shuei_ai_chat/feature/home/data/model/attribute_age_filter_model.dart';
import 'package:shuei_ai_chat/feature/home/data/model/attribute_filter_model.dart';
import 'package:shuei_ai_chat/feature/home/presentation/cubit/home_filter_cubit.dart';
import 'package:shuei_ai_chat/feature/home/presentation/cubit/home_recommend_cubit.dart';

class HomeFilterWidget extends StatefulWidget {
  const HomeFilterWidget({
    super.key,
  });

  @override
  HomeFilterWidgetState createState() => HomeFilterWidgetState();
}

class HomeFilterWidgetState extends State<HomeFilterWidget> {
  final List<AttributeFilterModel> _genders = [];

  final List<AttributeAgeFilterModel> _ages = [];

  final List<AttributeFilterModel> _hobbies = [];

  final List<AttributeFilterModel> _occupations = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<HomeFilterCubit>()
          ..getListAgesAction()
          ..getListGendersAction()
          ..getListHobbiesAction()
          ..getListOccupationAction();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '絞り込み',
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () => Navigator.pop(
            context,
          ),
        ),
      ),
      body: BlocListener<HomeFilterCubit, HomeFilterState>(
        listener: (context, state) {
          if (state is GetListGendersSuccessState) {
            _genders.clear();
            _genders.addAll(
              state.genders ?? [],
            );
            setState(() {});
          } else if (state is GetListAgesSuccessState) {
            _ages.clear();
            _ages.addAll(
              state.ages ?? [],
            );
            setState(() {});
          } else if (state is GetListHobbiesSuccessState) {
            _hobbies.clear();
            _hobbies.addAll(
              state.hobbies ?? [],
            );
            setState(() {});
          } else if (state is GetListOccupationSuccessState) {
            _occupations.clear();
            _occupations.addAll(
              state.occupation ?? [],
            );
            setState(() {});
          }
        },
        child: ListView(
          padding: const EdgeInsets.all(
            16.0,
          ),
          children: [
            const Text(
              '地域',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
            _genders.isNotEmpty
                ? Wrap(
                    spacing: 10.0,
                    children: _genders.map(
                      (gender) {
                        return ChoiceChip(
                          label: Text(
                            gender.name ?? '',
                          ),
                          selected: context
                              .watch<AppProvider>()
                              .selectedGender
                              .where(
                                (e) => e.name == gender.name,
                              )
                              .isNotEmpty,
                          onSelected: (bool selected) {
                            setState(
                              () {
                                if (selected) {
                                  context
                                      .read<AppProvider>()
                                      .selectedGender
                                      .add(
                                        gender,
                                      );
                                } else {
                                  context
                                      .read<AppProvider>()
                                      .selectedGender
                                      .removeWhere(
                                        (e) => e.name == gender.name,
                                      );
                                }
                              },
                            );
                          },
                        );
                      },
                    ).toList(),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '学歴',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
            _ages.isNotEmpty
                ? Wrap(
                    spacing: 10.0,
                    children: _ages.map((age) {
                      return ChoiceChip(
                        label: Text(
                          age.name ?? '',
                        ),
                        selected: context
                            .watch<AppProvider>()
                            .selectedAge
                            .where(
                              (e) => e.name == age.name,
                            )
                            .isNotEmpty,
                        onSelected: (bool selected) {
                          setState(
                            () {
                              if (selected) {
                                context.read<AppProvider>().selectedAge.add(
                                      age,
                                    );
                              } else {
                                context.read<AppProvider>().selectedAge.remove(
                                      age,
                                    );
                              }
                            },
                          );
                        },
                      );
                    }).toList(),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'スタイル',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
            _hobbies.isNotEmpty
                ? Wrap(
                    spacing: 10.0,
                    children: _hobbies.map(
                      (hobby) {
                        return FilterChip(
                          label: Text(
                            hobby.name ?? '',
                          ),
                          selected: context
                              .watch<AppProvider>()
                              .selectedHobbies
                              .where(
                                (e) => e.name == hobby.name,
                              )
                              .isNotEmpty,
                          onSelected: (bool selected) {
                            setState(
                              () {
                                if (selected) {
                                  context
                                      .read<AppProvider>()
                                      .selectedHobbies
                                      .add(
                                        hobby,
                                      );
                                } else {
                                  context
                                      .read<AppProvider>()
                                      .selectedHobbies
                                      .removeWhere(
                                        (e) => e.name == hobby.name,
                                      );
                                }
                              },
                            );
                          },
                        );
                      },
                    ).toList(),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '趣味',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
            _occupations.isNotEmpty
                ? Wrap(
                    spacing: 10.0,
                    children: _occupations.map((occupation) {
                      return FilterChip(
                        label: Text(
                          occupation.name ?? '',
                        ),
                        selected: context
                            .watch<AppProvider>()
                            .selectedOccupation
                            .where(
                              (e) => e.name == occupation.name,
                            )
                            .isNotEmpty,
                        onSelected: (bool selected) {
                          setState(
                            () {
                              if (selected) {
                                context
                                    .read<AppProvider>()
                                    .selectedOccupation
                                    .add(
                                      occupation,
                                    );
                              } else {
                                context
                                    .read<AppProvider>()
                                    .selectedOccupation
                                    .removeWhere(
                                      (e) => e.name == occupation.name,
                                    );
                              }
                            },
                          );
                        },
                      );
                    }).toList(),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(
                    context,
                  ),
                  child: const Text(
                    'キャンセル',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<HomeRecommendCubit>().getRecommendAgentAction(
                          context.read<AppProvider>().getFilter(),
                        );
                    Navigator.pop(
                      context,
                    );
                  },
                  child: const Text(
                    '保存',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
