import 'package:flutter/material.dart';

class HomeFilterWidget extends StatefulWidget {
  const HomeFilterWidget({
    super.key,
  });

  @override
  HomeFilterWidgetState createState() => HomeFilterWidgetState();
}

class HomeFilterWidgetState extends State<HomeFilterWidget> {
  double age = 25;

  double area = 25;

  List<String> regions = ['アジア', 'ヨーロッパ', 'アメリカ'];

  String selectedRegion = 'アメリカ';

  List<String> education = ['大学', '専門学校', '中学校'];

  String selectedEducation = '大学';

  List<String> styles = ['可愛い', 'おもしろい', 'セクシー'];

  List<String> selectedStyles = [];

  List<String> hobbies = ['映画', '音楽', 'ゲーム'];

  List<String> selectedHobbies = [];

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
      body: Padding(
        padding: const EdgeInsets.all(
          16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '年齢',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
            Stack(
              children: [
                Slider(
                  value: age,
                  min: 0,
                  max: 100,
                  divisions: 100,
                  label: '${age.toInt()}歳',
                  onChanged: (value) {
                    setState(() {
                      age = value;
                    });
                  },
                ),
                const Positioned.fill(
                  top: -30.0,
                  left: 20.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '0',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0,
                        ),
                      ),
                      Text(
                        '100歳',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Text(
              'エリア',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
            Stack(
              children: [
                Slider(
                  value: area,
                  min: 0,
                  max: 100,
                  divisions: 100,
                  label: '${area.toInt()}km',
                  onChanged: (value) {
                    setState(() {
                      area = value;
                    });
                  },
                ),
                const Positioned.fill(
                  top: -30.0,
                  left: 20.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '0',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0,
                        ),
                      ),
                      Text(
                        '100km',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '地域',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
            Wrap(
              spacing: 10.0,
              children: regions.map((region) {
                return ChoiceChip(
                  label: Text(region),
                  selected: selectedRegion == region,
                  onSelected: (bool selected) {
                    setState(() {
                      selectedRegion = region;
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
              children: education.map((level) {
                return ChoiceChip(
                  label: Text(level),
                  selected: selectedEducation == level,
                  onSelected: (bool selected) {
                    setState(() {
                      selectedEducation = level;
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
              children: styles.map((style) {
                return FilterChip(
                  label: Text(style),
                  selected: selectedStyles.contains(style),
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        selectedStyles.add(style);
                      } else {
                        selectedStyles.remove(style);
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
              children: hobbies.map((hobby) {
                return FilterChip(
                  label: Text(hobby),
                  selected: selectedHobbies.contains(hobby),
                  onSelected: (bool selected) {
                    setState(
                      () {
                        if (selected) {
                          selectedHobbies.add(hobby);
                        } else {
                          selectedHobbies.remove(hobby);
                        }
                      },
                    );
                  },
                );
              }).toList(),
            ),
            const Spacer(),
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
