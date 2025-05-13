import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../login/widgets/login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState()
  {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 2), () {
          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
            }
            );
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: height * 0.29,),
          Center(
            child: Image.asset(
                "assets/images/splash_logo.png",
              height: height * 0.4,
              width: width * 0.4,
            ),
          ).animate().scale(),
          SizedBox(height: height * 0.27,),
          Text(
            "Enjoy your trip with us in Egypt",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ).animate().scale(),
        ],
      )

    );
  }
}
