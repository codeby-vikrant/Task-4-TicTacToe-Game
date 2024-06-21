import 'package:flutter/material.dart';
import 'package:task_4_tick_tac_toe_game/screens/game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: GameScreen(),
    );
  }
}
