import 'package:flutter/material.dart';
import 'package:shuei_ai_chat/feature/home/data/model/ai_agent_model.dart';

class AIAGentCardWidget extends StatelessWidget {
  final AIAgentModel agentModel;

  final double? imageWidth;

  final bool isShowDetail;

  const AIAGentCardWidget(
    this.agentModel, {
    super.key,
    this.imageWidth,
    this.isShowDetail = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(
            10.0,
          ),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(
              0.2,
            ),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(
              0,
              3,
            ),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Image.asset(
              agentModel.image ?? '',
              width: imageWidth ?? MediaQuery.sizeOf(context).width,
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(
              16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${agentModel.name} (${agentModel.subName})',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Visibility(
                  visible: isShowDetail,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 5.0,
                    ),
                    child: Text(
                      agentModel.description ?? '',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isShowDetail,
                  child: Wrap(
                    children: [
                      ...agentModel.attributes?.keys.map(
                            (attr) => Chip(
                              label: Text(
                                attr,
                              ),
                            ),
                          ) ??
                          [],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
