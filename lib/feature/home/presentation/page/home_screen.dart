import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:shuei_ai_chat/core/helpers/event_bus.dart';
import 'package:shuei_ai_chat/feature/home/data/model/ai_agent_model.dart';
import 'package:shuei_ai_chat/feature/home/presentation/widget/ai_agent_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final CardSwiperController controller = CardSwiperController();

  late AIAgentModel _currentAgent;

  final List<AIAgentModel> _agents = [
    AIAgentModel(
      id: '001',
      name: 'さくら',
      subName: 'Sakura',
      description:
          'A calm and intelligent AI agent who excels at problem-solving and managing large tasks.',
      attributes: {
        'intelligence': 9.5,
        'empathy': 8.0,
        'agility': 6.0,
        'communication': 9.0,
      },
      image: 'assets/image/sakura.png',
    ),
    AIAgentModel(
      id: '002',
      name: 'ひかり',
      subName: 'Hikari',
      description:
          'A lively and enthusiastic AI agent known for her energy and creativity.',
      attributes: {
        'intelligence': 7.5,
        'empathy': 8.5,
        'agility': 7.0,
        'creativity': 9.5,
      },
      image: 'assets/image/hikari.png',
    ),
    AIAgentModel(
      id: '003',
      name: 'あい',
      subName: 'Ai',
      description:
          'An empathetic and thoughtful AI agent specializing in customer support and emotional intelligence.',
      attributes: {
        'intelligence': 8.0,
        'empathy': 9.8,
        'communication': 9.5,
        'problem_solving': 7.5,
      },
      image: 'assets/image/ai.png',
    ),
    AIAgentModel(
      id: '004',
      name: 'みゆき',
      subName: 'Miyuki',
      description:
          'A calm and reserved AI agent who excels in organizing and structuring complex tasks.',
      attributes: {
        'intelligence': 8.5,
        'empathy': 7.0,
        'organization': 9.8,
        'attention_to_detail': 9.0,
      },
      image: 'assets/image/miyuki.png',
    ),
    AIAgentModel(
      id: '005',
      name: 'つばさ',
      subName: 'Tsubasa',
      description:
          'A dynamic and strong-willed AI agent focused on leadership and decision making.',
      attributes: {
        'intelligence': 9.0,
        'leadership': 9.7,
        'agility': 8.0,
        'problem_solving': 9.2,
      },
      image: 'assets/image/tsubasa.png',
    ),
    AIAgentModel(
      id: '006',
      name: 'すみれ',
      subName: 'Sumire',
      description:
          'An artistic AI agent with a creative mind and excellent visualization skills.',
      attributes: {
        'intelligence': 7.5,
        'empathy': 7.8,
        'creativity': 9.8,
        'communication': 8.0,
      },
      image: 'assets/image/sumire.png',
    ),
  ];

  var _cards = [];

  @override
  void initState() {
    super.initState();
    _cards = _agents.map(AIAGentCardWidget.new).toList();
    _currentAgent = _agents[0];
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: CardSwiper(
                controller: controller,
                cardsCount: _cards.length,
                onSwipe: _onSwipe,
                onUndo: _onUndo,
                numberOfCardsDisplayed: 2,
                padding: const EdgeInsets.all(
                  16.0,
                ),
                cardBuilder: (
                  context,
                  index,
                  horizontalThresholdPercentage,
                  verticalThresholdPercentage,
                ) =>
                    _cards[index],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: controller.undo,
                    child: const Icon(
                      Icons.rotate_left,
                      color: Colors.blueAccent,
                    ),
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () => controller.swipe(
                      CardSwiperDirection.left,
                    ),
                    child: const Icon(
                      Icons.heart_broken_outlined,
                      color: Colors.redAccent,
                    ),
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () {
                      controller.swipe(
                        CardSwiperDirection.right,
                      );
                      eventBus.fire(
                        AddFavoriteEvent(
                          _currentAgent,
                        ),
                      );
                      eventBus.fire(
                        GoToFavoriteEvent(),
                      );
                    },
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.greenAccent,
                    ),
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () {
                      controller.swipe(
                        CardSwiperDirection.right,
                      );
                      // TODO Go to chat screen
                    },
                    child: const Icon(
                      Icons.chat_bubble,
                      color: Colors.purpleAccent,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    _currentAgent = _agents[currentIndex!];
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undo from the ${direction.name}',
    );
    return true;
  }
}
