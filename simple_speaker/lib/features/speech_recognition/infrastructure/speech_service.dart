// ignore_for_file: depend_on_referenced_packages

import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';


class SpeechService {
  final SpeechToText _speech = SpeechToText();

  Future<bool> initialize() async {
    return await _speech.initialize();
  }

  Future<bool> listen({
    required Function(SpeechRecognitionResult) onResult,
    String? localeId,
  }) async {
    return await _speech.listen(
      localeId: localeId,
      onResult: onResult,
    );
  }

  Future<void> stop() async {
    await _speech.stop();
  }

  Future<List<LocaleName>> getLocales() async {
    return await _speech.locales();
  }

  Future<LocaleName?> getSystemLocale() async {
    return await _speech.systemLocale();
  }
}
