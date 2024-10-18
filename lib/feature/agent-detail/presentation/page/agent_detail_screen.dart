import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuei_ai_chat/core/base/widget/base_button_widget.dart';
import 'package:shuei_ai_chat/core/base/widget/base_image_loading_widget.dart';
import 'package:shuei_ai_chat/core/di/injection_container.dart';
import 'package:shuei_ai_chat/core/helpers/app_constants.dart';
import 'package:shuei_ai_chat/core/helpers/app_utils.dart';
import 'package:shuei_ai_chat/core/navigation/navigation_center.dart';
import 'package:shuei_ai_chat/feature/authentication/presentation/cubit/login_cubit.dart';
import 'package:shuei_ai_chat/feature/authentication/presentation/page/login_screen.dart';
import 'package:shuei_ai_chat/feature/chat/data/model/chat_history_model.dart';
import 'package:shuei_ai_chat/feature/chat/presentation/cubit/chat_detail_cubit.dart';
import 'package:shuei_ai_chat/feature/chat/presentation/page/chat_detail_screen.dart';
import 'package:shuei_ai_chat/feature/home/data/model/ai_agent_model.dart';
import 'package:shuei_ai_chat/generated/l10n.dart';

class AgentDetailScreen extends StatefulWidget {
  final AIAgentModel agentModel;

  final String screen;

  const AgentDetailScreen({
    super.key,
    required this.agentModel,
    required this.screen,
  });

  @override
  AgentDetailScreenState createState() => AgentDetailScreenState();
}

class AgentDetailScreenState extends State<AgentDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(
            context,
          ),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20.0,
          ),
        ),
        title: Text(
          widget.agentModel.name ?? '',
          style: AppConstants.textHeadingH5.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24.0,
          horizontal: 16.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag:
                    '${widget.agentModel.id ?? widget.agentModel.agentId}-${widget.screen}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    16.0,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: widget.agentModel.photo ?? '',
                    errorWidget: (context, url, error) => Image.asset(
                      AppConstants.icHolderList,
                    ),
                    placeholder: (context, url) =>
                        const BaseImageLoadingWidget(),
                    width: MediaQuery.sizeOf(context).width,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.agentModel.name ?? '',
                    style: AppConstants.textBody1Regular.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  BaseButtonWidget(
                    width: 120.0,
                    height: 36.0,
                    text: S.of(context).message,
                    onClick: () => NavigationCenter.goToScreen(
                      AppUtils.contextMain,
                      AppUtils.isLogin
                          ? NavigationCenter.chatDetailScreen
                          : NavigationCenter.loginScreen,
                      AppUtils.isLogin
                          ? BlocProvider(
                              create: (_) => sl<ChatDetailCubit>(),
                              child: ChatDetailScreen(
                                data: ChatHistoryModel(
                                  agentId: widget.agentModel.id,
                                  photo: widget.agentModel.photo,
                                  name: widget.agentModel.name,
                                ),
                              ),
                            )
                          : BlocProvider(
                              create: (_) => sl<LoginCubit>(),
                              child: const LoginScreen(),
                            ),
                    ),
                    buttonState: ButtonState.normal,
                  )
                ],
              ),
              const SizedBox(
                height: 4.0,
              ),
              Text(
                '${widget.agentModel.age}歳',
                style: AppConstants.textBody1Regular.copyWith(
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              Text(
                '${S.of(context).place}: ${widget.agentModel.place ?? ''}',
                style: AppConstants.textBody1Regular.copyWith(
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              Text(
                widget.agentModel.note ?? '',
                style: AppConstants.textBody1Regular.copyWith(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
