import 'package:flutter/material.dart';
import 'package:shuei_ai_chat/core/helpers/event_bus.dart';
import 'package:shuei_ai_chat/feature/home/data/model/ai_agent_model.dart';
import 'package:shuei_ai_chat/feature/home/presentation/widget/ai_agent_card_widget.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  FavoriteScreenState createState() => FavoriteScreenState();
}

class FavoriteScreenState extends State<FavoriteScreen> {
  final List<AIAgentModel> _favorites = [];

  @override
  void initState() {
    super.initState();
    eventBus.on<AddFavoriteEvent>().listen(
      (event) {
        _favorites.add(
          event.agentModel,
        );
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 0.6,
      ),
      itemCount: _favorites.length,
      itemBuilder: (context, index) {
        return AIAGentCardWidget(
          _favorites[index],
          imageWidth: MediaQuery.sizeOf(context).width * .5,
        );
      },
    );
  }
}
