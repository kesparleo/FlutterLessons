import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:avatar_glow/avatar_glow.dart';
import 'package:simple_speaker/features/speech_recognition/application/speech_controller.dart';
import 'package:flutter/services.dart';
import 'package:simple_speaker/shared/widgets/language_dropdown.dart';

class SpeechPage extends StatefulWidget {
  const SpeechPage({super.key});

  @override
  State<SpeechPage> createState() => _SpeechPageState();
}

class _SpeechPageState extends State<SpeechPage> {
  final SpeechController _controller = SpeechController();

  @override
  void initState() {
    super.initState();
    _controller.init();
    _controller.addListener(_onUpdate);
  }

  @override
  void dispose() {
    _controller.removeListener(_onUpdate);
    super.dispose();
  }

  void _onUpdate() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _controller.isListening,
        glowColor: Colors.blue,
        duration: const Duration(milliseconds: 1000),
        repeat: true,
        child: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: _controller.toggleListening,
          child: Icon(
            _controller.isListening ? Icons.mic : Icons.mic_none,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      appBar: AppBar(title: const Text('Reconhecimento de Voz')),
      body: SingleChildScrollView(
        reverse: true,
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            if (_controller.availableLocales.isNotEmpty)
              LanguageDropdown(
                locales: _controller.availableLocales,
                selected: _controller.selectedLocaleId,
                onChanged: _controller.changeLocale,
              ),
            const SizedBox(height: 20),
            Text(
              _controller.recognizedText,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: _controller.recognizedText));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Texto copiado para a área de transferência')),
                );
              },
              child: const Text(
                'Copiar',
                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Confiança: ${(_controller.confidence * 100).toStringAsFixed(1)}%',
              style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
