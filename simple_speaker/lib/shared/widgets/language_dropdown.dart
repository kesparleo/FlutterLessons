// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class LanguageDropdown extends StatelessWidget {
  final List<LocaleName> locales;
  final String? selected;
  final void Function(String?) onChanged;

  const LanguageDropdown({
    super.key,
    required this.locales,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selected,
      icon: const Icon(Icons.language),
      onChanged: onChanged,
      items: locales.map((locale) {
        return DropdownMenuItem<String>(
          value: locale.localeId,
          child: Text(locale.name),
        );
      }).toList(),
    );
  }
}
