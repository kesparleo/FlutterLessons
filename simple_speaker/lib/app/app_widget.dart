import 'package:flutter/material.dart';
import '../features/speech_recognition/presentation/pages/speech_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reconhecimento de Voz',
      home: SpeechPage(),
    );
  }
}
