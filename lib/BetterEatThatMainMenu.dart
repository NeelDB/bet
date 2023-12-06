import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calories Tracker'),
        ),
        body: MainMenuPage(),
      ),
    );
  }
}

class CaloriesRemaining extends StatefulWidget {
  @override
  _CaloriesRemainingState createState() => _CaloriesRemainingState();
}

class _CaloriesRemainingState extends State<CaloriesRemaining> {
  int meta = 2300;
  int alimentos = 0;
  int exercicio = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Meta: $meta calories'),
        TextField(
          keyboardType: TextInputType.number,
          onChanged: (value) {
            setState(() {
              alimentos = int.parse(value);
            });
          },
          decoration: InputDecoration(labelText: 'Enter consumed calories'),
        ),
        // You can add more widgets for exercise input, display remaining calories, etc.
      ],
    );
  }
}

class MainMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Main Menu Page',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          CaloriesRemaining(), // Use the CaloriesRemaining widget here or customize it as needed
        ],
      ),
    );
  }
}
