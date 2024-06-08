import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Screens/TicTacGame.dart';
import 'package:tic_tac_toe/Screens/enterpage.dart';
import 'package:tic_tac_toe/Screens/splashScreen.dart';

import '../Screens/HomeScreen.dart';
class AppRoutes
{
  static Map<String,Widget Function (BuildContext)>routes={

    '/':(context)=>SplashScreen(),
    '/enter':(context)=>EnterPage(),
    '/tictac':(context)=>HomeScreen(),
    // '/tictac2':(context)=>TicTac(),

  };
}
