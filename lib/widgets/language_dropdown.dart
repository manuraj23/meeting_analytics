import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class LanguageDropdown extends StatelessWidget {
  final List<stt.LocaleName> availableLanguages;
  final String selectedLanguage;
  final ValueChanged<String> onLanguageChanged;

  const LanguageDropdown({
    required this.availableLanguages,
    required this.selectedLanguage,
    required this.onLanguageChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedLanguage,
      onChanged: (String? newLang) {
        if (newLang != null) {
          onLanguageChanged(newLang);
        }
      },
      items: availableLanguages
          .map((locale) => DropdownMenuItem(
        value: locale.localeId,
        child: Text(locale.name),
      ))
          .toList(),
    );
  }
}
