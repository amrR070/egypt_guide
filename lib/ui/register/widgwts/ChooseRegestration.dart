import 'package:flutter/material.dart';

import 'RegisterUser.dart';
import 'TourGuideRegister.dart';

class ChooseRegistration extends StatefulWidget {
  static const String routeName = "chooseRegistration";

  @override
  State<ChooseRegistration> createState() => _ChooseRegistrationState();
}

class _ChooseRegistrationState extends State<ChooseRegistration> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Color backgroundTextColor = Color(0xFF0A3D62);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          'Choose Registration Type',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width * 0.6,
                height: height * 0.10,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegisterUser.routeName);
                  },
                  child: Text(
                    "Register as User",
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: backgroundTextColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

              SizedBox(height: height * 0.035),

              Container(
                width: width * 0.6,
                height: height * 0.10,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, TourGuideRegister.routeName);
                  },
                  child: Text(
                    "Register as Tour Guide",
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: backgroundTextColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
