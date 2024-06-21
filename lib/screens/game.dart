import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_4_tick_tac_toe_game/constants/colors.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  static var customFontWhite = GoogleFonts.coiny(
      textStyle:
          const TextStyle(color: tWhiteColor, letterSpacing: 3, fontSize: 28));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text(
          "Flutter Tic-Tac-Toe Game",
          style: customFontWhite,
        ),
      ),
    );
  }
}
