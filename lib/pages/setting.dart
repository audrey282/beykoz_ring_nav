import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:beykoz_nav/pages/langauges.dart';
import 'package:beykoz_nav/pages/noti.dart';
import 'package:beykoz_nav/pages/feedback.dart';

class Setting extends StatefulWidget {
  final Locale locale;
  final Function(Locale) onLanguageChanged;

  const Setting({
    super.key,
    required this.locale,
    required this.onLanguageChanged,
  });

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  File? _profileImage;

  @override
  void initState() {
    super.initState();
    _loadProfileImage();
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
      _saveProfileImagePath(pickedFile.path);
    }
  }

  Future<void> _saveProfileImagePath(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile_image_path', path);
  }

  Future<void> _loadProfileImage() async {
    final prefs = await SharedPreferences.getInstance();
    final path = prefs.getString('profile_image_path');
    if (path != null && File(path).existsSync()) {
      setState(() {
        _profileImage = File(path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4A0D0D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A0D0D),
        title: const Text('Settings', style: TextStyle(color: Colors.white)),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: _profileImage != null
                      ? FileImage(_profileImage!)
                      : const AssetImage('images/no_user.jpg') as ImageProvider,
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Audrey',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('phnin529@gmail.com',
                      style: TextStyle(color: Colors.white70)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
          _sectionTitle('GENERAL'),
          _settingsTile(
            context,
            Icons.language,
            'Language',
            'Change app language',
            screen: Langauges(
              locale: widget.locale,
              onLanguageChanged: widget.onLanguageChanged,
            ),
          ),
          _settingsTile(
            context,
            Icons.notifications,
            'Notification',
            'alert',
            screen: const NotificationsScreen(),
          ),
          const SizedBox(height: 30),
          _sectionTitle('ACCOUNT'),
          _settingsTile(
            context,
            Icons.logout,
            'Logout',
            '',
            onTap: () => _showLogoutDialog(context),
          ),
          _settingsTile(
            context,
            Icons.delete,
            'Delete Account',
            '',
            onTap: () => _showDeleteDialog(context),
          ),
          const SizedBox(height: 30),
          _sectionTitle('FEEDBACK'),
          _settingsTile(
            context,
            Icons.thumb_up,
            'Send Feedback',
            '',
            screen: const SendFeedbackScreen(),
          ),
        ],
      ),
    );
  }

  Widget _settingsTile(
      BuildContext context,
      IconData icon,
      String title,
      String subtitle, {
        VoidCallback? onTap,
        Widget? screen,
      }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      subtitle: subtitle.isNotEmpty
          ? Text(subtitle,
          style: const TextStyle(color: Colors.white60, fontSize: 12))
          : null,
      trailing:
      const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white70),
      onTap: onTap ??
              () {
            if (screen != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => screen),
              );
            }
          },
    );
  }

  Widget _sectionTitle(String title) {
    return Text(title,
        style: const TextStyle(color: Colors.white70, fontSize: 12));
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Logged out successfully")),
              );
            },
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete Account"),
        content: const Text(
            "This will permanently delete your account. Are you sure?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Account deleted")),
              );
            },
            child:
            const Text("Delete", style: TextStyle(color: Colors.redAccent)),
          ),
        ],
      ),
    );
  }
}
