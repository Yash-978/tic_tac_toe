import 'dart:async';

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
int attempt = 0;
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
    double h= MediaQuery.of(context).size.height;
    double w= MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          padding: EdgeInsets.all(8),
          height: h*0.990+2,
          width: w*0.980+10,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('Assets/Images/tic toc tce.jpg'),
              fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: h*0.085,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: w*0.009,
                  ),
                  Column(
                    children: [
                      Text(
                        'Player O ',
                        style: TextStyle(
                            fontFamily: 'font',
                            color: Colors.black,
                            fontSize: 20,
                            // fontFamily: 'DesignFont',

                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        O_Score.toString(),
                        style: TextStyle(
                            fontFamily: 'font',
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Player X ',
                        style: TextStyle(
                            fontFamily: 'font',
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        X_Score.toString(),
                        style: TextStyle(
                            fontFamily: 'font',
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 120,
              ),
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
                          padding: EdgeInsets.all(4),
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: matchedIndex.contains(index)
                                  ? Colors.green
                                  : Colors.black26,
                              border: Border.all(color:
                              // Colors.green
                                Color(0xffFFD700),
                              ),
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Center(
                            child: Text(
                              TicTacList[index],
                              style: TextStyle(
                                fontFamily: 'font',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      O_Score = 0;
                      X_Score = 0;
                    });
                  },
                  child: Text('Reset')),
            ],
          ),
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
          // Timer(Duration(seconds: 3), () {
          //   Navigator.pushReplacement(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => HomeScreen(),
          //     ),
          //   );
          // });
          return AlertDialog(
            title: Text(
              'WINNER ! : ' + winner,
              style: GoogleFonts.pressStart2p(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    RefressGame();
                    Navigator.of(context).pop();
                    setState(() {
                      matchedIndex = []; /*to rebuild color to empty*/
                    });
                  },
                  child: Text(
                    // attempt == 0 ? 'Start' : 'Play Again!'
                    'Play Again!',
                    style: GoogleFonts.pressStart2p(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ))
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
            title: Text(
              'Draw :',
              style: GoogleFonts.pressStart2p(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    RefressGame();
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Play Again',
                    style: GoogleFonts.pressStart2p(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ))
            ],
          );
        });
  }
}
