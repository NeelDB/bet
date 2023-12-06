// food.dart

import 'package:flutter/material.dart';

class Food extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildFoodItem('Chicken'),
          _buildFoodItem('Gelatina'),
          _buildFoodItem('Preto'),
          _buildFoodItem('Melancia'),
        ],
      ),
    );
  }

  Widget _buildFoodItem(String foodName) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        foodName,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
