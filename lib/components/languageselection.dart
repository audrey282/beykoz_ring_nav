import 'package:flutter/material.dart';

class LanguageSelectionScreen extends StatelessWidget {
  final Locale currentLocale;
  final Function(Locale) onLocaleChanged;

  const LanguageSelectionScreen({
    super.key,
    required this.currentLocale,
    required this.onLocaleChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Language")),
      body: ListView(
        children: [
          _languageTile(context, 'English', const Locale('en')),
          _languageTile(context, 'Türkçe', const Locale('tr')),
          _languageTile(context, 'Deutsch', const Locale('de')),
          _languageTile(context, 'Français', const Locale('fr')),
          _languageTile(context, 'Español', const Locale('es')),
          _languageTile(context, 'العربية', const Locale('ar')),
          _languageTile(context, '日本語', const Locale('ja')),
          _languageTile(context, '中文', const Locale('zh')),
          _languageTile(context, 'Русский', const Locale('ru')),
        ],
      ),
    );
  }

  Widget _languageTile(BuildContext context, String title, Locale locale) {
    return ListTile(
      title: Text(title),
      trailing: currentLocale.languageCode == locale.languageCode
          ? const Icon(Icons.check, color: Color.fromARGB(255, 143, 25, 25))
          : null,
      onTap: () {
        onLocaleChanged(locale);
        Navigator.pop(context);
      },
    );
  }
}
