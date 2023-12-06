import 'package:flutter/material.dart';

class BetterEatThatSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/profile_picture.jpg'), // You should replace this with your actual image
            ),
            SizedBox(height: 20),
            Text(
              'John Doe', // Replace with the actual username
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                // Add navigation to the settings page
              },
            ),
            ListTile(
              title: Text('Nel'),
              onTap: () {
                // Add navigation to the "Nel" functionality
              },
            ),
            ListTile(
              title: Text('Didi'),
              onTap: () {
                // Add navigation to the "Didi" functionality
              },
            ),
          ],
        ),
      ),
    );
  }
}
