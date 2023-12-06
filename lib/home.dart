import 'package:flutter/material.dart';

import 'BetterEatThatAIPage.dart';
import 'BetterEatThatMainMenu.dart';
import 'BetterEatThatPanel.dart';
import 'BetterEatThatSettingsPage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    // Initialize the instance
    var betterEatThatAI = BetterEatThatAIPage(onMealSelected: (List<Map<String, dynamic>> selectedMeals) {
    });

    _pages = [
      const MainMenuPage(),
      BetterEatThatPanel(betterEatThatAI: betterEatThatAI),
      BetterEatThatAIPage(onMealSelected: (List<Map<String, dynamic>> selectedMeals) {
      }),
      const BetterEatThatSettingsPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BetterEatThat'),
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Main Menu',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/food_icon.png', width: 24, height: 24),
              label: 'Panel',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/AI_icon.png', width: 24, height: 24),
              label: 'AI',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          selectedIconTheme: const IconThemeData(
            color: Colors.blue,
          ),
          unselectedIconTheme: const IconThemeData(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}