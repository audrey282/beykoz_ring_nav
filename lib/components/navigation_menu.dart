import 'package:beykoz_nav/pages/bus.dart';
import 'package:beykoz_nav/pages/campus.dart';
import 'package:beykoz_nav/pages/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {
  runApp(const NavigationMenu());
}

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  _NavigationMenuState createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _selectedIndex = 0;
  Locale _locale = const Locale('en'); // Default language

  // Method to change language
  void _changeLanguage(Locale newLocale) {
    setState(() {
      _locale = newLocale; // Update the language/locale
    });
  }

  late final List<Widget> _screens;

  // List of screens to switch between
  @override
  void initState() {
    super.initState();
    _screens = [
      Campus(),
      BusList(),
      Setting(
        locale: _locale,
        onLanguageChanged: _changeLanguage,
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: _locale,
      supportedLocales: const [
        Locale('en'), Locale('tr'), Locale('de'), Locale('fr'),
        Locale('es'), Locale('ar'), Locale('ja'), Locale('zh'), Locale('ru'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Color.fromARGB(255, 143, 25, 25),
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.directions_bus), label: 'Bus'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
          ],
        ),
      ),
    );
  }
}
