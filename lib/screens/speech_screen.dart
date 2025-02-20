import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import '../widgets/mic_button.dart';
import '../widgets/language_dropdown.dart';

class SpeechToTextScreen extends StatefulWidget {
  @override
  _SpeechToTextScreenState createState() => _SpeechToTextScreenState();
}

class _SpeechToTextScreenState extends State<SpeechToTextScreen> {
  stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _text = "Press the mic and start speaking...";
  String _selectedLanguage = 'en_IN'; // ✅ Set English (India) as default
  List<stt.LocaleName> _availableLanguages = [];

  @override
  void initState() {
    super.initState();
    _fetchAvailableLanguages();
  }

  void _fetchAvailableLanguages() async {
    bool available = await _speech.initialize();
    if (available) {
      List<stt.LocaleName> locales = await _speech.locales();
      setState(() {
        _availableLanguages = locales;
        _selectedLanguage = locales.any((locale) => locale.localeId == 'en_IN')
            ? 'en_IN'
            : (locales.isNotEmpty ? locales.first.localeId : 'en_US'); // ✅ Fallback
      });
    }
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize();
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (result) {
            setState(() {
              _text = result.recognizedWords;
            });
          },
          localeId: _selectedLanguage,
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🎙 Speech to Text', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 4.0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlue.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LanguageDropdown(
                availableLanguages: _availableLanguages,
                selectedLanguage: _selectedLanguage,
                onLanguageChanged: (newLang) {
                  setState(() {
                    _selectedLanguage = newLang;
                  });
                },
              ),
              SizedBox(height: 20),

              // Speech Output Box (Full Width)
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16),
                  width: double.infinity,  // 👈 Ensures full device width
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      _text,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              MicButton(isListening: _isListening, onPressed: _listen),
            ],
          ),
        ),
      ),
    );
  }
}
