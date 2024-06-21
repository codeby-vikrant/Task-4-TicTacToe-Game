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
        backgroundColor: MainColor.primaryColor,
        body: const Column(
          children: [
            Expanded(
              flex: 1,
              child: Text("Score Board"),
            ),
            Expanded(
              flex: 3,
              child: Text("Box Board"),
            ),
            Expanded(
              flex: 2,
              child: Text("Timer"),
            )
          ],
        ));
  }
}
