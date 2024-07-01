import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EnterPage extends StatefulWidget {
  const EnterPage({super.key});
  //tic tac toe
  @override
  State<EnterPage> createState() => _EnterPageState();
}

class _EnterPageState extends State<EnterPage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(8),
          height: h * 0.990 + 2,
          width: w * 0.980 + 10,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('Assets/Images/Enterpage.png'),
                fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              SizedBox(
                height: h * 0.65,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/tictac');
                },
                child: Container(
                  height: h * 0.1,
                  width: w * 0.800,
                  alignment: Alignment.center,

                  decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        /*isme multiple colors ka combination lekar colors banane he jo kis list ke form me honge*/
                        // Color(0xff8539BA),

                        // Colors.yellow,
                        // Colors.yellow,
                        Color(0xff089789),
                        // Color(0xffF1DEBA),
                        // Color(0xffFBBF09),
                        Colors.green,

                      ]),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.green.shade700)),
                  child: Text(
                    'Play Game',
                    style: TextStyle(
                        fontFamily: 'font',
                        color: Colors.black,
                        fontSize: 20,
                        // fontFamily: 'DesignFont',
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
