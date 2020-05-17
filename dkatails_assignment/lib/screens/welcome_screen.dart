import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: Text(
          'Welcome to the App!',
          style: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 19.0,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
