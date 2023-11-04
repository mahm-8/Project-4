import 'package:flutter/material.dart';
import 'package:store_watch/screens/profile_screen.dart';
import 'package:store_watch/screens/signup_screen.dart';
import 'package:store_watch/screens/signin_screen.dart';

//13
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUp(),
    );
  }
}
