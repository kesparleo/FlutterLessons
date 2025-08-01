// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:simple_speaker/features/speech_recognition/infrastructure/speech_service.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';


class SpeechController extends ChangeNotifier {
  final SpeechService _service = SpeechService();

  bool isListening = false;
  String recognizedText = "Pressione e fale";
  double confidence = 1.0;
  List<LocaleName> availableLocales = [];
  String? selectedLocaleId;

  Future<void> init() async {
    final success = await _service.initialize();
    if (success) {
      availableLocales = await _service.getLocales();
      final systemLocale = await _service.getSystemLocale();
      selectedLocaleId = systemLocale?.localeId ?? availableLocales.first.localeId;
      notifyListeners();
    }
  }

  Future<void> toggleListening() async {
    if (!isListening) {
      final started = await _service.listen(
        localeId: selectedLocaleId,
        onResult: (SpeechRecognitionResult result) {
          if (result.recognizedWords.isNotEmpty) {
            recognizedText = result.recognizedWords;
            if (result.hasConfidenceRating && result.confidence > 0) {
              confidence = result.confidence;
            }
            notifyListeners();
          }
        },
      );
      if (started) {
        isListening = true;
        notifyListeners();
      }
    } else {
      await _service.stop();
      isListening = false;
      notifyListeners();
    }
  }

  void changeLocale(String? locale) {
    selectedLocaleId = locale;
    notifyListeners();
  }
}
