import 'package:flutter/material.dart';

class LanguageSelectionScreen extends StatelessWidget {
  final Locale currentLocale;

  const LanguageSelectionScreen({
    super.key,
    required this.currentLocale,
  });

  @override
  Widget build(BuildContext context) {
    final languages = {
      'English': const Locale('en'),
      'Türkçe': const Locale('tr'),
      'Français': const Locale('fr'),
      'العربية': const Locale('ar'),
      'Русский': const Locale('ru'),
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Language',
            style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF4A0D0D),
      ),
      backgroundColor: const Color(0xFF4A0D0D),
      body: ListView(
        children: languages.entries.map((entry) {
          final languageName = entry.key;
          final locale = entry.value;

          return ListTile(
            title: Text(
              languageName,
              style: const TextStyle(color: Colors.white),
            ),
            trailing: currentLocale == locale
                ? const Icon(Icons.check, color: Colors.white)
                : null,
            onTap: () {
              Navigator.pop(context, locale); // ⬅ Return selected locale
            },
          );
        }).toList(),
      ),
    );
  }
}
