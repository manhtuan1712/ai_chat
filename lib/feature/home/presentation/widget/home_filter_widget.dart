import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuei_ai_chat/feature/home/data/model/attribute_age_filter_model.dart';
import 'package:shuei_ai_chat/feature/home/data/model/attribute_filter_model.dart';
import 'package:shuei_ai_chat/feature/home/presentation/cubit/home_filter_cubit.dart';

class HomeFilterWidget extends StatefulWidget {
  const HomeFilterWidget({
    super.key,
  });

  @override
  HomeFilterWidgetState createState() => HomeFilterWidgetState();
}

class HomeFilterWidgetState extends State<HomeFilterWidget> {
  final List<AttributeFilterModel> _genders = [];

  final List<AttributeFilterModel> _selectedGender = [];

  final List<AttributeAgeFilterModel> _ages = [];

  final List<AttributeAgeFilterModel> _selectedAge = [];

  final List<AttributeFilterModel> _hobbies = [];

  final List<AttributeFilterModel> _selectedHobbies = [];

  final List<AttributeFilterModel> _occupations = [];

  final List<AttributeFilterModel> _selectedOccupation = [];

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
            Wrap(
              spacing: 10.0,
              children: _genders.map((gender) {
                return ChoiceChip(
                  label: Text(
                    gender.name ?? '',
                  ),
                  selected: _selectedGender.contains(gender),
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        _selectedGender.add(gender);
                      } else {
                        _selectedGender.remove(gender);
                      }
                    });
                  },
                );
              }).toList(),
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
            Wrap(
              spacing: 10.0,
              children: _ages.map((age) {
                return ChoiceChip(
                  label: Text(
                    age.name ?? '',
                  ),
                  selected: _selectedAge.contains(age),
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        _selectedAge.add(age);
                      } else {
                        _selectedAge.remove(age);
                      }
                    });
                  },
                );
              }).toList(),
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
            Wrap(
              spacing: 10.0,
              children: _hobbies.map((hobby) {
                return FilterChip(
                  label: Text(
                    hobby.name ?? '',
                  ),
                  selected: _selectedHobbies.contains(hobby),
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        _selectedHobbies.add(hobby);
                      } else {
                        _selectedHobbies.remove(hobby);
                      }
                    });
                  },
                );
              }).toList(),
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
            Wrap(
              spacing: 10.0,
              children: _occupations.map((occupation) {
                return FilterChip(
                  label: Text(
                    occupation.name ?? '',
                  ),
                  selected: _selectedOccupation.contains(occupation),
                  onSelected: (bool selected) {
                    setState(
                      () {
                        if (selected) {
                          _selectedOccupation.add(occupation);
                        } else {
                          _selectedOccupation.remove(occupation);
                        }
                      },
                    );
                  },
                );
              }).toList(),
            ),
            const Spacer(),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Cancel action
                  },
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
                    // Save action
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
