import 'package:flutter/material.dart';

class Langauges extends StatefulWidget {
  final Locale locale;
  final Function(Locale) onLanguageChanged;

  const Langauges({
    super.key,
    required this.locale,
    required this.onLanguageChanged,
  });

  @override
  State<Langauges> createState() => _LangaugesState();
}

class _LangaugesState extends State<Langauges> {
  late Locale _locale;

  @override
  void initState() {
    super.initState();
    _locale = widget.locale;
  }

  // Change language and notify the parent widget
  void _changeLanguage(Locale newLocale) {
    widget.onLanguageChanged(newLocale);
    Navigator.pop(context); // Go back to settings screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Language")),
      body: ListView(
        children: [
          _languageTile('English', const Locale('en')),
          _languageTile('Türkçe', const Locale('tr')),
          _languageTile('Deutsch', const Locale('de')),
          _languageTile('Français', const Locale('fr')),
          _languageTile('Español', const Locale('es')),
          _languageTile('العربية', const Locale('ar')),
          _languageTile('日本語', const Locale('ja')),
          _languageTile('中文', const Locale('zh')),
          _languageTile('Русский', const Locale('ru')),
        ],
      ),
    );
  }

  Widget _languageTile(String title, Locale locale) {
    return ListTile(
      title: Text(title),
      trailing: _locale.languageCode == locale.languageCode
          ? const Icon(Icons.check, color: Color.fromARGB(255, 143, 25, 25))
          : null,
      onTap: () => _changeLanguage(locale),
    );
  }
}
