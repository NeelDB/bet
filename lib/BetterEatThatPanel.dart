// BetterEatThatPanel.dart
import 'package:flutter/material.dart';
import 'BetterEatThatAIPage.dart';

class BetterEatThatPanel extends StatefulWidget {
  final BetterEatThatAIPage betterEatThatAI;

  BetterEatThatPanel({required this.betterEatThatAI});

  @override
  _BetterEatThatPanelState createState() => _BetterEatThatPanelState();
}

class _BetterEatThatPanelState extends State<BetterEatThatPanel> {
  List<Map<String, dynamic>> breakfastFoods = [];
  int consumedCalories = 0;
  // Add a variable to store the information from BetterEatThatAI
  String aiInformation = '';

  void initState() {
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    // Access caloriesForTheDay from BetterEatThatAI
    int myCalories = widget.betterEatThatAI.caloriesForTheDay;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Top Section: Calories Count
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      '$myCalories - $consumedCalories = ${myCalories - consumedCalories}',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Middle Section: Breakfast
                  _buildBreakfastSection(),
                ],
              ),
            ),
          ),
          // Bottom Section: Add Food Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Navigate to the Food class
                Navigator.of(context).push(_createRoute());
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              child: Text(
                'Add Food',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBreakfastSection() {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start, // Align to the left
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Breakfast Information
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Breakfast',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          // Display the added foods below the section
          ListView.builder(
            shrinkWrap: true,
            itemCount: breakfastFoods.length,
            itemBuilder: (context, index) {
              return _buildFoodItem(
                breakfastFoods[index]['foodName'],
                breakfastFoods[index]['calories'],
              );
            },
          ),
          // AI Information
          Container(
            padding: EdgeInsets.only(top: 16.0),
            child: Text(
              aiInformation,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // AI Recommended Foods
      // AI Recommended Foods
      Container(
        padding: EdgeInsets.only(top: 16.0),
        child: Text('AI Recommended Foods:'),
      ),
      // Display AI recommended foods below the section
      ListView.builder(
        shrinkWrap: true,
        itemCount: widget.betterEatThatAI.getSelectedMeals().length,
        itemBuilder: (context, index) {
          return _buildFoodItem(
            widget.betterEatThatAI.getSelectedMeals()[index]['foodName'],
            widget.betterEatThatAI.getSelectedMeals()[index]['calories'],
          );
        },
      )
        ],
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          Food(onFoodSelected: (foodName, calories) {
            // Add the selected food and calories to the list
            _showMealSelectionDialog(foodName, calories);
          }),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  Widget _buildFoodItem(String foodName, int calories) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            foodName,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '$calories kcal',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  // Show a dialog to select the meal for adding food
  Future<void> _showMealSelectionDialog(String foodName, int calories) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Meal'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                _buildMealSelectionButton('Breakfast', () {
                  // Add the selected food and calories to the Breakfast list
                  setState(() {
                    breakfastFoods.add({'foodName': foodName, 'calories': calories});
                    consumedCalories += calories; // Update consumed calories
                  });
                  Navigator.pop(context); // Close the dialog
                }),
                _buildMealSelectionButton('Lunch', () {
                  // Add the selected food and calories to the Lunch list (you can implement this part as needed)
                  // ...
                }),
                _buildMealSelectionButton('Dinner', () {
                  // Add the selected food and calories to the Dinner list (you can implement this part as needed)
                  // ...
                }),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMealSelectionButton(String meal, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(meal),
    );
  }
}

class Food extends StatelessWidget {
  final Function(String, int) onFoodSelected;

  Food({required this.onFoodSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildFoodItem('Chicken', 160, context),
            _buildFoodItem('Gelatina', 50, context),
            _buildFoodItem('Arroz', 30, context),
            _buildFoodItem('Melancia', 40, context),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodItem(String foodName, int calories, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Call the callback function to add the selected food and calories to the list
        onFoodSelected(foodName, calories);
        // Pop the route to go back to the previous screen
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(12.0),
          child: Text(
            foodName,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
