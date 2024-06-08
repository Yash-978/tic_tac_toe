import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Screens/HomeScreen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 450,
            width: 400,
            decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(80),
                    bottomLeft: Radius.circular(80))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 190,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('Assets/Images/XOGameClubLogo.png'),
                          fit: BoxFit.cover),

                      borderRadius: BorderRadius.circular(15)),
                  child: Text('Tic Tac Toe',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                ),
                SizedBox(
                  height: 10,
                ),
                // AppName(Size: 30.00),
                SizedBox(height: 10,),
                LinearProgressIndicator(
                  minHeight: 3,
                  backgroundColor: Colors.white,
                  color: Colors.deepPurpleAccent.shade200,
                )
              ],
            ),
          ),
          SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}
