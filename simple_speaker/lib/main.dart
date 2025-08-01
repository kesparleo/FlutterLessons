

import 'package:flutter/material.dart';
import 'app/app_widget.dart';

void main() {
  runApp(const AppWidget());
}

/*
// ignore_for_file: prefer_final_fields, library_private_types_in_public_api, unnecessary_string_interpolations, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:avatar_glow/avatar_glow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Reconhecimento de Voz',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isListening = false;
  late SpeechToText _speechToText = SpeechToText();
  String text = "Pressione e fale";
  double confidence = 1.0;

  List<LocaleName> _locales = [];
  String? _selectedLocaleId;

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    bool available = await _speechToText.initialize();
    if (available) {
      _locales = await _speechToText.locales();
      _selectedLocaleId = _locales.firstWhere(
        (locale) => locale.localeId == 'pt-PT',
        orElse: () => _locales.first,
      ).localeId;
      setState(() {});
    }
  }

  void captureVoice() async {
    if (!isListening) {
      bool listen = await _speechToText.initialize();
      if (listen) {
        setState(() => isListening = true);
        _speechToText.listen(
          localeId: _selectedLocaleId,
          onResult: (result) => setState(() {
            text = result.recognizedWords;
            if (result.hasConfidenceRating && result.confidence > 0) {
              confidence = result.confidence;
            }
          }),
        );
      }
    } else {
      setState(() => isListening = false);
      _speechToText.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: isListening,
        glowColor: Colors.blue,
        duration: const Duration(milliseconds: 1000),
        repeat: true,
        child: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: captureVoice,
          child: Icon(
            isListening ? Icons.mic : Icons.mic_none,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      appBar: AppBar(title: const Text('Reconhecimento de Voz')),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              if (_locales.isNotEmpty)
                DropdownButton<String>(
                  value: _selectedLocaleId,
                  icon: const Icon(Icons.language),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedLocaleId = newValue!;
                    });
                  },
                  items: _locales.map<DropdownMenuItem<String>>((LocaleName locale) {
                    return DropdownMenuItem<String>(
                      value: locale.localeId,
                      child: Text(locale.name),
                    );
                  }).toList(),
                ),
              const SizedBox(height: 20),
              Text(
                text,
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: text));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Texto copiado para a área de transferência')),
                    );
                  },
                  child: const Text(
                    'Copiar',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Confiança: ${(confidence * 100.0).toStringAsFixed(1)}%',
                style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/