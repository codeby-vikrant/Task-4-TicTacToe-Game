import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_4_tick_tac_toe_game/constants/colors.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool oTurn = true;
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];
  String resultDeclaration = '';
  bool winnerFound = false;
  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;

  static var customFontWhite = GoogleFonts.coiny(
      textStyle:
          const TextStyle(color: tWhiteColor, letterSpacing: 3, fontSize: 28));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MainColor.primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Center(
                    child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Player O",
                            style: customFontWhite,
                          ),
                          Text(
                            oScore.toString(),
                            style: customFontWhite,
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Player X",
                            style: customFontWhite,
                          ),
                          Text(
                            xScore.toString(),
                            style: customFontWhite,
                          )
                        ],
                      ),
                    ],
                  ),
                )),
              ),
              Expanded(
                  flex: 3,
                  child: GridView.builder(
                      itemCount: 9,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            _tapped(index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  width: 5, color: MainColor.primaryColor),
                              color: MainColor.secondaryColor,
                            ),
                            child: Center(
                              child: Text(
                                displayXO[index],
                                style: GoogleFonts.coiny(
                                    textStyle: TextStyle(
                                        fontSize: 64.0,
                                        color: MainColor.primaryColor)),
                              ),
                            ),
                          ),
                        );
                      })),
              Expanded(
                flex: 2,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        resultDeclaration,
                        style: customFontWhite,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            _clearBoard();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: tWhiteColor,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 16)),
                          child: const Text(
                            "Play Again",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  void _tapped(int index) {
    setState(() {
      if (oTurn && displayXO[index] == '') {
        displayXO[index] = 'O';
        filledBoxes++;
      } else if (!oTurn && displayXO[index] == '') {
        displayXO[index] = "X";
        filledBoxes++;
      }
      oTurn = !oTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    //1st row
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player ${displayXO[0]} Wins!';
        _updateScore(displayXO[0]);
      });
    }
    //2nd row
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      setState(() {
        resultDeclaration = 'Player ${displayXO[3]} Wins!';
        _updateScore(displayXO[3]);
      });
    }
    //3rd row
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      setState(() {
        resultDeclaration = 'Player ${displayXO[6]} Wins!';
        _updateScore(displayXO[6]);
      });
    }
    //1st column
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player ${displayXO[0]} Wins!';
        _updateScore(displayXO[0]);
      });
    }
    //2nd column
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      setState(() {
        resultDeclaration = 'Player ${displayXO[1]} Wins!';
        _updateScore(displayXO[1]);
      });
    }
    //3rd column
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      setState(() {
        resultDeclaration = 'Player ${displayXO[2]} Wins!';
        _updateScore(displayXO[2]);
      });
    }
    //diagonal
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player ${displayXO[0]} Wins!';
        _updateScore(displayXO[0]);
      });
    }
    //diagonal2
    if (displayXO[6] == displayXO[4] &&
        displayXO[6] == displayXO[2] &&
        displayXO[6] != '') {
      setState(() {
        resultDeclaration = 'Player ${displayXO[6]} Wins!';
        _updateScore(displayXO[6]);
      });
    }
    if (!winnerFound && filledBoxes == 9) {
      setState(() {
        resultDeclaration = "Nobody Wins!";
      });
    }
  }

  void _updateScore(String winner) {
    if (winner == '0') {
      oScore++;
    } else if (winner == 'X') {
      xScore++;
    }
    winnerFound = true;
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = '';
      }
    });
  }
}
