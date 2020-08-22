import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('I am poor'),
          backgroundColor: Colors.lightBlue[800],
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/code_for_food.png'),
          ),
        ),
      ),
    ),
  );
}
