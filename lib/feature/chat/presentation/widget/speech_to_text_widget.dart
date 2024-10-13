import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shuei_ai_chat/core/helpers/app_utils.dart';
import 'package:shuei_ai_chat/core/theme/app_colors.dart';
import 'package:shuei_ai_chat/generated/l10n.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechToTextWidget extends StatefulWidget {
  const SpeechToTextWidget({super.key});

  @override
  SpeechToTextWidgetState createState() => SpeechToTextWidgetState();
}

class SpeechToTextWidgetState extends State<SpeechToTextWidget> {
  final SpeechToText _speechToText = SpeechToText();

  bool _speechEnabled = false;

  String _lastWords = '';

  @override
  void initState() {
    super.initState();
    _initSpeech();
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 24.0,
        horizontal: 16.0,
      ),
      child: Row(
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
                    Navigator.pop(
                      context,
                      _lastWords,
                    );
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
    );
  }
}
