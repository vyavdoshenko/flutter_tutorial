import 'package:flutter/material.dart';

// This is entry point for any Flutter application.
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('I Am Rich'),
          backgroundColor: Colors.blueGrey[900],
        ),
        backgroundColor: Colors.blueGrey,
        body: Center(
          child: Image(
            image: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQWthuOqxSy0aIGfvUeFgcCifExVdsQ4HIacg&usqp=CAU'),
          ),
        ),
      ),
    ),
  );
}
