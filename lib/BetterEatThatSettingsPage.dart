import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'login.dart';

class BetterEatThatSettingsPage extends StatelessWidget {
  const BetterEatThatSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                  'assets/profile_picture.jpg'), // You should replace this with your actual image
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
            LogoutButton()
          ],
        ),
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});


  Future<void> logout() async {
    final GoogleSignIn googleSign = GoogleSignIn();
    await googleSign.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        side: MaterialStateProperty.all(const BorderSide(color: Colors.red)),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
      ),
      onPressed: () {
        logout();
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Login()));
      },
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Logout',
          style: TextStyle(
            color: Colors.red, // Text color is set to red
          ),
        ),
      ),
    );
  }
}
