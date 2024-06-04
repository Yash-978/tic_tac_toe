import 'package:flutter/material.dart';

class TicTac extends StatefulWidget {
  const TicTac({super.key});

  @override
  State<TicTac> createState() => _TicTacState();
}

int attempt =0; /*used to show start button first time and
 the from the 2nd it will show play again in the
 elevated button below*/
List<int> matchedIndex = [];
bool winnerFound = false;
int filledBoxes = 0; /*to count the how many boxes are filled*/
String resultDeclaration = '';
int drawCondition = 0;
int O_Score = 0;
int X_Score = 0;
String showOX = '';
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

class _TicTacState extends State<TicTac> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'Player O ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        O_Score.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Player X ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        X_Score.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(

              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => Tapped(index),
                      child: Container(
                        decoration: BoxDecoration(
                            color: matchedIndex.contains(index) ? Colors.yellow
                                : Colors.red,
                            border: Border.all(color: Colors.white)),
                        child: Center(
                          child: Text(
                            TicTacList[index],
                            style: TextStyle(
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
            Center(
              child: Text(
                resultDeclaration,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  ClearBoard();
                  attempt++;

                },
                child: Text(
                  attempt == 0 ? 'Start' : 'Play Again!',
                  style: TextStyle(fontSize: 30),
                )),
            SizedBox(
              height: 160,
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
        filledBoxes++;
      } else if (!O_Turn && TicTacList[index] == '') {
        TicTacList[index] = 'X';
        filledBoxes++;
      }
      O_Turn = !O_Turn; /*to change player turn O to X and vice versa */
      CheckWinner();
    });
  }

  void CheckWinner() {
    /*check first Row*/
    if (TicTacList[0] == TicTacList[1] &&
        TicTacList[0] == TicTacList[2] &&
        TicTacList[0] != '') {
      setState(() {
        resultDeclaration = 'Player ' + TicTacList[0] + ' Wins';
        UpdateScore(TicTacList[0]);
        matchedIndex.addAll([0, 1, 2]);
      });
    }
    /*check 2nd Row*/
    if (TicTacList[3] == TicTacList[4] &&
        TicTacList[3] == TicTacList[5] &&
        TicTacList[3] != '') {
      setState(() {
        resultDeclaration = 'Player' + TicTacList[3] + 'Wins';
        UpdateScore(TicTacList[3]);
        matchedIndex.addAll([3, 4, 5]);
      });
    }
    /*check 3rd Row*/
    if (TicTacList[6] == TicTacList[7] &&
        TicTacList[6] == TicTacList[8] &&
        TicTacList[6] != '') {
      setState(() {
        resultDeclaration = 'Player' + TicTacList[6] + 'Wins';
        UpdateScore(TicTacList[6]);
        matchedIndex.addAll([6, 7, 8]);
      });
    }
    /*check 1st Column*/
    if (TicTacList[0] == TicTacList[3] &&
        TicTacList[0] == TicTacList[6] &&
        TicTacList[0] != '') {
      setState(() {
        resultDeclaration = 'Player' + TicTacList[0] + 'Wins';
        UpdateScore(TicTacList[0]);
        matchedIndex.addAll([0, 3, 6]);
      });
    }
    /*check 2nd Column*/
    if (TicTacList[1] == TicTacList[4] &&
        TicTacList[1] == TicTacList[7] &&
        TicTacList[1] != '') {
      setState(() {
        resultDeclaration = 'Player' + TicTacList[1] + 'Wins';
        UpdateScore(TicTacList[1]);
        matchedIndex.addAll([1, 4, 7]);
      });
    }

    /*check 3rd Column*/
    if (TicTacList[2] == TicTacList[5] &&
        TicTacList[2] == TicTacList[8] &&
        TicTacList[2] != '') {
      setState(() {
        resultDeclaration = 'Player' + TicTacList[2] + 'Wins';
        UpdateScore(TicTacList[2]);
        matchedIndex.addAll([2, 5, 8]);
      });
    }

    /*Check diagonal*/
    if (TicTacList[6] == TicTacList[2] &&
        TicTacList[6] == TicTacList[4] &&
        TicTacList[6] != '') {
      setState(() {
        resultDeclaration = 'Player' + TicTacList[6] + 'Wins';
        UpdateScore(TicTacList[6]);
        matchedIndex.addAll([6, 2, 4]);
      });
    }
    /*Check diagonal*/
    if (TicTacList[0] == TicTacList[4] &&
        TicTacList[0] == TicTacList[8] &&
        TicTacList[0] != '') {
      setState(() {
        resultDeclaration = 'Player' + TicTacList[0] + 'Wins';
        UpdateScore(TicTacList[0]);
        matchedIndex.addAll([0, 8, 4]);
      });
    }
    if (!winnerFound && filledBoxes == 9) {
      setState(() {
        resultDeclaration = 'Draw';
      });
    }
    /**/
  }

  void UpdateScore(String winner) {
    if (winner == 'O') {
      O_Score++;
    } else if (winner == 'X') {
      X_Score++;
    }
  }

  void ClearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        TicTacList[i] =
            ''; /*if all the boxes are empty then the result declaration will be empty */
      }
      resultDeclaration = '';
    });
    filledBoxes = 0;
  }
}
