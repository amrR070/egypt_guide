import 'package:flutter/material.dart';
import 'package:gp/ui/reset_password/reset_done.dart';

import '../../style/reusable_components/CustomButton.dart';
import '../../style/reusable_components/CustomTextFeild.dart';

class ResetPassword extends StatefulWidget {
  static const String routeName = "reset password";

  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmationController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordController = TextEditingController();
    passwordConfirmationController = TextEditingController();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();

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
                "Reset Password",
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
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/reset_logo.png",
                height: height * 0.22,
                width: width * 0.5,
              ),
              Text(
                "     Your new password must be\n different from previous password.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: height * 0.05),
              CustomFormFeild(
                lable: "enter your Password",
                keyboard: TextInputType.visiblePassword,
                controller: passwordController,
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Should enter your Password";
                  }
                  if(value.length < 8) {
                    return "Password should not be less than 8 characters";
                  }
                  return null;
                },
              ),
              SizedBox(height: height * 0.01),
              CustomFormFeild(
                lable: "enter your Password again",
                keyboard: TextInputType.visiblePassword,
                controller: passwordConfirmationController,
                isPassword: true,
                validator: (value) {
                  if(value != passwordController.text) {
                    return "Mismatch with Password";
                  }
                  return null;
                },
              ),
              SizedBox(height: height * 0.13),
              CustomButton(
                title: "                   Reset                   ",
                onPress: () {
                  resetPassword();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  resetPassword(){
    if(formKey.currentState!.validate()){
      Navigator.pushReplacementNamed(context, ResetDone.routeName);
    }
  }
}
