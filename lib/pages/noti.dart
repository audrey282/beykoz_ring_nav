import 'package:flutter/material.dart';
import 'package:beykoz_nav/components/nati_api.dart'; // Replace with your real path
//import 'package:permission_handler/permission_handler.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool newsForYou = true;
  bool accountActivity = false;
  bool newsletter = true;
  bool appUpdates = true;

  void _handleSwitchChange(String title, bool newValue) {
    setState(() {
      switch (title) {
        case 'News For You':
          newsForYou = newValue;
          break;
        case 'Account Activity':
          accountActivity = newValue;
          break;
        case 'Newsletter':
          newsletter = newValue;
          break;
        case 'App Updates':
          appUpdates = newValue;
          break;
      }
    });

    NotificationAPI.showNotification(
      title: 'Notification Update',
      body: '$title: ${newValue ? "On" : "Off"}',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4A0D0D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A0D0D),
        title: const Text('Notifications', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildSwitchTile('News For You', Icons.newspaper, newsForYou),
          _buildSwitchTile('Account Activity', Icons.account_circle, accountActivity),
          _buildSwitchTile('Newsletter', Icons.email, newsletter),
          _buildSwitchTile('App Updates', Icons.update, appUpdates),
        ],
      ),
    );
  }

  Widget _buildSwitchTile(String title, IconData icon, bool value) {
    return SwitchListTile(
      title: Text(title, style: const TextStyle(color: Colors.white)),
      secondary: Icon(icon, color: Colors.white),
      value: value,
      onChanged: (val) => _handleSwitchChange(title, val),
      activeColor: Colors.white,
      activeTrackColor: Colors.white54,
    );
  }
}
