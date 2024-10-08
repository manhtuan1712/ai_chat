import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shuei_ai_chat/core/helpers/app_constants.dart';
import 'package:shuei_ai_chat/feature/home/data/model/ai_agent_model.dart';

class AIAGentCardWidget extends StatelessWidget {
  final AIAgentModel agentModel;

  final bool isGrid;

  final double? imageWidth;

  const AIAGentCardWidget(
    this.agentModel, {
    super.key,
    this.isGrid = false,
    this.imageWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(
            16.0,
          ),
          child: CachedNetworkImage(
            imageUrl: agentModel.photo ?? '',
            errorWidget: (context, url, error) => Image.asset(
              isGrid ? AppConstants.icHolderGrid : AppConstants.icHolderList,
            ),
            width: imageWidth ?? MediaQuery.sizeOf(context).width,
            fit: BoxFit.fitWidth,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 11.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    '${agentModel.name}  (${agentModel.age}歳)',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    AppConstants.icMessage,
                    width: 24.0,
                    fit: BoxFit.fitWidth,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  SvgPicture.asset(
                    AppConstants.icFavorite,
                    width: 24.0,
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
