import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
// static var Newfont
List<int> matchedIndex = [];
String resultDeclaration = '';
int drawCondition = 0;
int O_Score = 0;
int X_Score = 0;
bool O_Turn = true; /*first player turn*/
List<String> TicTacList = [
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
];
String showOX = '';

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'Player O ',
                        style: GoogleFonts.pressStart2p(
                            color: Colors.white,
                            fontSize: 20,
                            // fontFamily: 'DesignFont',

                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        O_Score.toString(),
                        style: GoogleFonts.pressStart2p(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Player X ',
                        style: GoogleFonts.pressStart2p(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        X_Score.toString(),
                        style: GoogleFonts.pressStart2p(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 130,),
            Expanded(
              flex: 3,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => Tapped(index),
                      child: Container(
                        decoration: BoxDecoration(
                            color: matchedIndex.contains(index)
                                ? Colors.cyan.shade200
                                : Colors.black,
                            border: Border.all(color: Colors.white)),
                        child: Center(
                          child: Text(
                            TicTacList[index],
                            style: GoogleFonts.pressStart2p(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void Tapped(int index) {
    setState(() {
      if (O_Turn && TicTacList[index] == '') {
        TicTacList[index] = 'O';
        drawCondition++;
      } else if (!O_Turn && TicTacList[index] == '') {
        TicTacList[index] = 'X';
        drawCondition++;
      }
      O_Turn = !O_Turn;
      CheckWinner();
    });
  }

  void CheckWinner() {
    /*check first Row*/
    if (TicTacList[0] == TicTacList[1] &&
        TicTacList[0] == TicTacList[2] &&
        TicTacList[0] != '') {
      setState(() {
        matchedIndex.addAll([0, 1, 2]);
        GreetingBox(TicTacList[0]);
      });
    }
    /*check 2nd Row*/
    if (TicTacList[3] == TicTacList[4] &&
        TicTacList[3] == TicTacList[5] &&
        TicTacList[3] != '') {
      setState(() {
        matchedIndex.addAll([1, 3, 5]);
        GreetingBox(TicTacList[3]);
      });
    }
    /*check 3rd Row*/
    if (TicTacList[6] == TicTacList[7] &&
        TicTacList[6] == TicTacList[8] &&
        TicTacList[6] != '') {
      setState(() {
        matchedIndex.addAll([6, 7, 8]);
        GreetingBox(TicTacList[6]);
      });
    }
    /*check 1st Column*/
    if (TicTacList[0] == TicTacList[3] &&
        TicTacList[0] == TicTacList[6] &&
        TicTacList[0] != '') {
      setState(() {
        matchedIndex.addAll([0, 3, 6]);
        GreetingBox(TicTacList[0]);
      });
    }
    /*check 2nd Column*/
    if (TicTacList[1] == TicTacList[4] &&
        TicTacList[1] == TicTacList[7] &&
        TicTacList[1] != '') {
      setState(() {
        matchedIndex.addAll([1, 4, 7]);
        GreetingBox(TicTacList[1]);
      });
    }

    /*check 3rd Column*/
    if (TicTacList[2] == TicTacList[5] &&
        TicTacList[2] == TicTacList[8] &&
        TicTacList[2] != '') {
      setState(() {
        matchedIndex.addAll([2, 5, 8]);
        GreetingBox(TicTacList[2]);
      });
    }

    /*Check diagonal*/
    if (TicTacList[6] == TicTacList[2] &&
        TicTacList[6] == TicTacList[4] &&
        TicTacList[6] != '') {
      setState(() {
        matchedIndex.addAll([6, 2, 4]);
        GreetingBox(TicTacList[6]);
      });
    }
    /*Check diagonal*/
    if (TicTacList[0] == TicTacList[4] &&
        TicTacList[0] == TicTacList[8] &&
        TicTacList[0] != '') {
      setState(() {
        matchedIndex.addAll([0, 4, 8]);
        GreetingBox(TicTacList[0]);
      });
    }
    /**/

    else if (drawCondition == 9) {
      DrawBox();
    }
  }

  void GreetingBox(String winner) {
    showDialog(
        barrierDismissible: false,
        /*jab dialog box open hota he tab agar screen
        ke side par kahi par click kar dene par woh dialog
         box hatt jata or ye false karne par hatega nhi*/
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('WINNER ! : ' + winner),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    RefressGame();
                    Navigator.of(context).pop();
                    setState(() {
                      matchedIndex = [];/*to rebuild color to empty*/
                    });
                  },
                  child: Text('Play Again'))
            ],
          );
        });
    if (winner == 'O') {
      O_Score++;
    } else if (winner == 'X') {
      X_Score++;
    }
    RefressGame();
  }

  void RefressGame() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        TicTacList[i] = '';
      }
    });
    drawCondition = 0;
  }

  void DrawBox() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Draw'),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    RefressGame();
                    Navigator.of(context).pop();
                  },
                  child: Text('Play Again'))
            ],
          );
        });
  }
}
