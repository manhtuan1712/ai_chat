import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shuei_ai_chat/core/helpers/global_configs.dart';

class SSEService {
  final String url;

  final _controller = StreamController<String>();

  SSEService(this.url);

  Stream<String> get stream => _controller.stream;

  Future<void> connect(
    Map<String, dynamic> data,
  ) async {
    try {
      final request = http.Request(
        'POST',
        Uri.parse(
          url,
        ),
      );
      request.body = jsonEncode(
        data,
      );
      request.headers['Authorization'] =
          'Bearer ${dotenv.env[GlobalConfig.difyApiKey]}';
      request.headers['Content-Type'] = 'application/json';
      request.headers['Charset'] = 'utf-8';

      final response = await request.send();
      var dataMerge = '';
      response.stream.transform(utf8.decoder).listen(
        (data) {
          dataMerge += data;
          if (dataMerge.contains('message_end')) {
            List<String> list = dataMerge.split('\n\n');
            for (String character in list) {
              if (character.isNotEmpty) {
                _controller.add(
                  '${character.replaceAll(
                    'data: ',
                    '{"data": ',
                  )}}',
                );
              }
            }
          }
        },
      );
    } catch (e) {
      debugPrint('======> error $e');
      _controller.addError('Error connecting to SSE: $e');
    }
  }

  void dispose() {
    _controller.close();
  }
}
