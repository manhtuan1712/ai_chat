import 'dart:convert';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shuei_ai_chat/core/base/widget/base_image_loading_widget.dart';
import 'package:shuei_ai_chat/core/helpers/app_constants.dart';
import 'package:shuei_ai_chat/core/helpers/app_utils.dart';
import 'package:shuei_ai_chat/core/theme/app_colors.dart';
import 'package:shuei_ai_chat/feature/chat/presentation/cubit/chat_detail_cubit.dart';
import 'package:shuei_ai_chat/feature/home/data/model/ai_agent_model.dart';
import 'package:shuei_ai_chat/generated/l10n.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:typewritertext/typewritertext.dart';

class SpeechToTextWidget extends StatefulWidget {
  final AIAgentModel agentModel;

  const SpeechToTextWidget({
    super.key,
    required this.agentModel,
  });

  @override
  SpeechToTextWidgetState createState() => SpeechToTextWidgetState();
}

class SpeechToTextWidgetState extends State<SpeechToTextWidget> {
  final SpeechToText _speechToText = SpeechToText();

  bool _speechEnabled = false;

  String _lastWords = '';

  final AudioPlayer _audioPlayer = AudioPlayer();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initSpeech();
    _audioPlayer.onPlayerComplete.listen(
      (event) {},
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    if (!_speechEnabled) {
      AppUtils.showToastMessage(
        S.of(context).speechIsNotAvailable,
        context,
      );
      Navigator.pop(
        context,
      );
    }
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    _lastWords = result.recognizedWords;
  }

  Future<void> _playVoiceAction(
    String voice,
  ) async {
    _audioPlayer.setReleaseMode(
      ReleaseMode.stop,
    );
    Uint8List audioBytes = base64Decode(
      voice,
    );
    await _audioPlayer.setSource(
      BytesSource(
        audioBytes,
      ),
    );
    await _audioPlayer.resume();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatDetailCubit, ChatDetailState>(
      listener: (context, state) {
        if (state is ChatDetailLoadingState) {
          _isLoading = true;
          setState(() {});
        } else if (state is ChatVoiceReceivedState) {
          _lastWords = '';
          _isLoading = false;
          _playVoiceAction(
            state.messageModel.voice ?? '',
          );
          setState(() {});
        } else if (state is ChatVoiceFailureState) {
          _isLoading = false;
          setState(() {});
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24.0,
          horizontal: 16.0,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                16.0,
              ),
              child: CachedNetworkImage(
                imageUrl: widget.agentModel.photo ?? '',
                errorWidget: (context, url, error) => Image.asset(
                  AppConstants.icHolderList,
                ),
                placeholder: (context, url) => const BaseImageLoadingWidget(),
                width: MediaQuery.sizeOf(context).width,
                fit: BoxFit.fitWidth,
              ),
            ),
            Visibility(
              visible: _isLoading,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(
                      32.0,
                    ),
                    child: SpinKitChasingDots(
                      color: AppColors.light.colorBrandBlue,
                      size: 100.0,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: TypeWriter.text(
                      _lastWords,
                      duration: const Duration(
                        milliseconds: 50,
                      ),
                      textAlign: TextAlign.center,
                      style: AppConstants.textHeadingH5.copyWith(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _speechToText.isListening
                    ? Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                          ).copyWith(
                            right: 8.0,
                          ),
                          child: SpinKitWave(
                            color: AppColors.light.colorBrandBlue10,
                            size: 200.0,
                            itemCount: 20,
                          ),
                        ),
                      )
                    : const SizedBox(),
                _speechToText.isListening
                    ? IconButton(
                        onPressed: () {
                          _stopListening();
                          if (_lastWords.isNotEmpty) {
                            context
                                .read<ChatDetailCubit>()
                                .sendVoiceMessageAction(
                                  _lastWords,
                                  widget.agentModel.id ?? '',
                                );
                          }
                        },
                        icon: Icon(
                          Icons.send,
                          color: AppColors.light.colorBrandBlue,
                          size: 40.0,
                        ),
                      )
                    : IconButton(
                        onPressed: () => _startListening(),
                        icon: Icon(
                          Icons.mic,
                          color: AppColors.light.colorBrandBlue,
                          size: 60.0,
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
