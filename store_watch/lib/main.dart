import 'package:flutter/material.dart';
import 'package:store_watch/screens/get_started_screen.dart';
import 'package:store_watch/screens/navi_bar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: NaviBar(),
    );
  }
}
