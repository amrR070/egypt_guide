import 'package:flutter/material.dart';
import 'package:gp/ui/questions/questions.dart';
import '../../style/reusable_components/CustomButton.dart';
import '../../style/reusable_components/CustomTextFeild.dart';
import '../../validation.dart';
import '../register/RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Login",
          style: TextStyle(
              color: Colors.white,
              fontWeight:FontWeight.bold ,
              fontSize: 20
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
              children: [
                Image.asset(
                  "assets/images/app_icon.png",
                  height: height * 0.13,
                  width: width * 0.5,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Welcome Back To Egypt Guide",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Please sign in with your mail",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                _buildLabel("E-mail Address"),
                CustomFormFeild(
                  lable: "enter your email",
                  keyboard: TextInputType.emailAddress,
                  controller: emailController,
                  validator: Validation.emailValidator,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                _buildLabel("Password"),
                CustomFormFeild(
                  lable: "enter your Password",
                  keyboard: TextInputType.visiblePassword,
                  controller: passwordController,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                    {
                      return "Should enter your Password";
                    }
                    if(value.length < 8)
                    {
                      return "Password should not be less than 8 characters";
                    }
                    return null;
                  },
                ),
                // Align(
                //   alignment: Alignment.centerRight,
                //   child: TextButton(
                //       onPressed: () {
                //         Navigator.of(context).pushNamed(ForgetPassword.routeName);
                //       },
                //       child: Text(
                //         "Forget Password",
                //         style: TextStyle(
                //           fontSize: 16,
                //           fontWeight: FontWeight.w400,
                //           color: Colors.white,
                //         ),
                //       )
                //   ),
                // ),
                SizedBox(
                  height: height * 0.06,
                ),
                CustomButton(
                  title: "                 Login                 ",
                  onPress: (){
                    login();

                  },
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(RegisterScreen.routeName);
                    },
                    child: Text(
                      "Don't have an account? Register",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
  login(){
    if(formKey.currentState!.validate()){
      Navigator.pushReplacementNamed(context, Questions.routeName);
    }
  }
}