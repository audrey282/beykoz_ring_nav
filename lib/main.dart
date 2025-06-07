import 'package:beykoz_nav/l10n/app_localizations.dart';
import 'package:beykoz_nav/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:beykoz_nav/components/nati_api.dart';
import 'package:beykoz_nav/l10n/L10n.dart';// Import your notification API

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required before async code
  await NotificationAPI.init(); // 🔔 Initialize notifications
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Beykoz Ring Navigation',
      theme: ThemeData(
        primaryColor: Color(0xFFB71C1C),
      ),
      supportedLocales: L10n.supportedLocales,
      locale: const Locale('en'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
      ],
      home: SplashScreen(),
    );
  }
}
