import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gp/ui/home/widgets/homeScreen.dart';


class QuestionsDone extends StatefulWidget {
  static const String routeName = "questions done";

  @override
  State<QuestionsDone> createState() => _QuestionsDoneState();
}

class _QuestionsDoneState extends State<QuestionsDone> {

  @override
  void initState()
  {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/questions_done.png",
                height: height * 0.2,
                width: width * 0.5,
              ),
              SizedBox(height: height * 0.01),
              Text(
                "                 Thank you!\n  We have received your answer",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],

          ),
        ),
      ),
    );
  }
}
