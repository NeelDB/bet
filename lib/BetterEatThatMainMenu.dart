import 'package:flutter/material.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
          child: Text(
            'Hello',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
    );
  }
}
