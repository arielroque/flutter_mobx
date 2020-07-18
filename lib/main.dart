import 'package:flutter/material.dart';
import 'package:fluttermobx/screens/login/login_screen.dart';
import 'package:fluttermobx/screens/login/stores/login_store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<LoginStore>(
      create: (_) => LoginStore(),
      child: MaterialApp(
        title: 'Flutter Mobx',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          cursorColor: Colors.deepPurple,
          scaffoldBackgroundColor: Colors.deepPurple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
