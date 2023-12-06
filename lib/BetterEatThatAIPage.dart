// BetterEatThatAIPage.dart
import 'package:flutter/material.dart';

class BetterEatThatAIPage extends StatefulWidget {
  int caloriesForTheDay = 2800;
  List<List<Map<String, dynamic>>> mealOptions = [
    [
      {'foodName': 'Chicken and Rice', 'calories': 300},
      // Add more meal options as needed
    ],
  ];
// Add a callback parameter
  final Function(List<Map<String, dynamic>>) onMealSelected;

  BetterEatThatAIPage({required this.onMealSelected});


  @override
  _BetterEatThatAIPageState createState() => _BetterEatThatAIPageState();

  List<Map<String, dynamic>> getSelectedMeals() {
    return _BetterEatThatAIPageState.selectedMeals;
  }
}

class _BetterEatThatAIPageState extends State<BetterEatThatAIPage> {
  static List<Map<String, dynamic>> selectedMeals = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display the selected meals
          Text(getSelectedMealsString()),
          SizedBox(height: 20),
          // Display meal options
          Text('Meal Options:'),
          displayMealOptions(widget.mealOptions),
        ],
      ),
    );
  }

  Widget displayMealOptions(List<List<Map<String, dynamic>>> mealOptions) {
    return Column(
      children: mealOptions.map((mealOptionList) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: mealOptionList.map((meal) {
            return ListTile(
              title: Text('${meal['foodName']} - ${meal['calories']} kcal'),
              onTap: () => selectMeal(meal),
            );
          }).toList(),
        );
      }).toList(),
    );
  }

  String getSelectedMealsString() {
    return selectedMeals
        .map((meal) => '${meal['foodName']} - ${meal['calories']} kcal')
        .join('otario\n');
  }

  void selectMeal(Map<String, dynamic> meal) {
    setState(() {
      // Check if the meal is not already selected
      if (!selectedMeals.contains(meal)) {
        selectedMeals.add(meal);
        widget.onMealSelected(selectedMeals); // Callback to update the UI
        // Handle the selected meals as needed
      }
    });
  }

}
