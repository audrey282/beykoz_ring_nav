import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore The Campus"),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black), // Show menu icon
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Navigation Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text('Campuses'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            myAppBar(), // Your custom app bar function
            SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  _campusCard("Bachelor Campus", "assets/bachelor.jpg"),
                  _campusCard("Rectorate Campus", "assets/rectorate.jpg"),
                  _campusCard("Labs and Studios", "assets/labs.jpg"),
                  _campusCard("Foreign Languages", "assets/foreign.jpg"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _campusCard(String title, String imagePath) {
    return Column(
      children: [
        Image.asset(imagePath, width: 100, height: 100),
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Padding myAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Explore The Campus",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Color.fromARGB(255, 143, 25, 25),
            ),
          ),
        ],
      ),
    );
  }
}
