import 'package:flutter/material.dart';
import '../../style/reusable_components/CustomButton.dart';
import '../../style/reusable_components/CustomTextFeild.dart';
import '../../validation.dart';
import '../verify_account/verify_account.dart';

class ForgetPassword extends StatefulWidget {
  static const String routeName = "forget password";
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  late TextEditingController emailController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(top: 23),
            child: Column(
              children: [
                Text(
                  "Forget Password",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: height * height * 0.000001,
                  width: width * 0.7,
                  color: Colors.white70,
                ),
              ],
            ),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "assets/images/forget_password.png",
                      height: height * 0.5,
                      width: width * 0.5,
                    ),
                    CustomFormFeild(
                      lable: "enter your email",
                      keyboard: TextInputType.emailAddress,
                      controller: emailController,
                      validator: Validation.emailValidator,
                    ),
                    SizedBox(height: height * 0.1),
                    CustomButton(
                      title: "                   Continue                   ",
                      onPress: () {
                        forgetPassword();
                      },
                    ),
                  ],
                ),
              ),
            ),
            ),
        );
    }
  forgetPassword(){
    if(formKey.currentState!.validate()){
      Navigator.pushReplacementNamed(context, VerifyAccount.routeName);
    }

  }

}