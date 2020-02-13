import 'package:flutter/material.dart';
import 'screens/loading_screen.dart';

void main() => runApp(Veveto());

class Veveto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.teal.shade400,
        scaffoldBackgroundColor: Color(0xFFFBFBFB),
      ),
      home: LoadingScreen(),
    );
  }
}
