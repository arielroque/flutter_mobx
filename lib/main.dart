import 'package:flutter/material.dart';
import 'package:fluttermobx/screens/login/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Mobx',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        cursorColor: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}

