import 'package:flutter/material.dart';

import '../../style/reusable_components/CustomButton.dart';
import '../login/widgets/login_screen.dart';

class ResetDone extends StatelessWidget {
  static const String routeName = "reset done";

  const ResetDone({super.key});

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
                "assets/images/reset_done_logo.png",
                height: height * 0.2,
                width: width * 0.5,
              ),
              Text(
                "Your Password reset\n       successfully",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: height * 0.05),
              CustomButton(
                title: "                 OK                 ",
                onPress: () {
                  Navigator.pushReplacementNamed(context, LoginScreen.routeName);

                },
              ),
            ],

          ),
        ),
      ),
    );
  }
}
