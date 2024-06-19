import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image Rating'),
        ),
        body: Center(
          child: Stack(
            children: <Widget>[
              Image.asset(
                'assets/sea1.jpg', // Replace this with your image path
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 10, // Adjust the top position
                left: 10, // Adjust the left position
                child: Row(
                  children: <Widget>[
                    Icon(Icons.star, color: Colors.yellow, size: 20), // Rating star 1
                    Icon(Icons.star, color: Colors.yellow, size: 20), // Rating star 2
                    Icon(Icons.star, color: Colors.yellow, size: 20), // Rating star 3
                    Icon(Icons.star, color: Colors.grey, size: 20),   // Rating star 4 (empty)
                    Icon(Icons.star, color: Colors.grey, size: 20),   // Rating star 5 (empty)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//final favorite = favorites[index];