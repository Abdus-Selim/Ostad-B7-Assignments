import 'package:flutter/material.dart';
import 'package:module_12_assignment_app/Screens/home_screen.dart';

void main() {
  runApp(MyBag());
}

class MyBag extends StatelessWidget {
  const MyBag({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
