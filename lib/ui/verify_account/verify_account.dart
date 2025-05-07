import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../style/reusable_components/CustomButton.dart';
import '../reset_password/reset_password.dart';

class VerifyAccount extends StatefulWidget {
  static const String routeName = "verify account";

  @override
  State<VerifyAccount> createState() => _VerifyAccountState();
}

class _VerifyAccountState extends State<VerifyAccount> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                "Verify Account",
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
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/verify_logo.png",
                  height: height * 0.27,
                  width: width * 0.5,
                ),
                SizedBox(height: height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 55,
                      width: 55,
                      child: TextFormField(
                          onChanged: (value) {
                            if(value.length ==1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Φ";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 55,
                      width: 55,
                      child: TextFormField(
                          onChanged: (value) {
                            if(value.length ==1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Φ";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 55,
                      width: 55,
                      child: TextFormField(
                        onChanged: (value) {
                          if(value.length ==1){
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Φ";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 55,
                      width: 55,
                      child: TextFormField(
                        onChanged: (value) {
                          if(value.length ==1){
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Φ";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 55,
                      width: 55,
                      child: TextFormField(
                        onChanged: (value) {
                          if(value.length ==1){
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Φ";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 55,
                      width: 55,
                      child: TextFormField(
                        onChanged: (value) {
                          if(value.length ==1){
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Φ";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.05),
                Text(
                  "Didn't receive code?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      // Navigator.of(context).pushNamed(RegisterScreen.routeName);
                    },
                    child: Text(
                      "Resend code",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.blue,
                      ),
                    )
                ),
                SizedBox(height: height * 0.15),
                CustomButton(
                  title: "                 Confirm                 ",
                  onPress: () {
                    verifyAccount();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  verifyAccount(){
    if(formKey.currentState!.validate()){
      Navigator.pushReplacementNamed(context, ResetPassword.routeName);
    }
  }
}