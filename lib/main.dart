
import 'package:flutter/material.dart';
import 'package:gp/style/AppStyle.dart';
import 'package:gp/ui/forget_password/forget_password.dart';
import 'package:gp/ui/home/tabs/All_Places_Tab/All_Places_Details.dart';
import 'package:gp/ui/home/tabs/Governorate_Tab/All_Governorate_places.dart';
import 'package:gp/ui/home/tabs/Governorate_Tab/Governorat_Places_details.dart';
import 'package:gp/ui/home/widgets/homeScreen.dart';
import 'package:gp/ui/login/widgets/login_screen.dart';
import 'package:gp/ui/questions/questions.dart';
import 'package:gp/ui/questions/questions_done.dart';
import 'package:gp/ui/register/widgwts/ChooseRegestration.dart';
import 'package:gp/ui/register/widgwts/RegisterUser.dart';
import 'package:gp/ui/register/widgwts/TourGuideRegister.dart';
import 'package:gp/ui/reset_password/reset_done.dart';
import 'package:gp/ui/reset_password/reset_password.dart';
import 'package:gp/ui/splash/splash_screen.dart';
import 'package:gp/ui/verify_account/verify_account.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppStyle.lightTheme,
      initialRoute: Questions.routeName,
      routes: {
        LoginScreen.routeName:(context) => LoginScreen(),
        RegisterUser.routeName:(context) => RegisterUser(),
        TourGuideRegister.routeName:(context) => TourGuideRegister(),
        ChooseRegistration.routeName:(context) => ChooseRegistration(),
        SplashScreen.routeName:(context) => SplashScreen(),
        ForgetPassword.routeName:(context) => ForgetPassword(),
        VerifyAccount.routeName:(context) => VerifyAccount(),
        ResetPassword.routeName:(context) => ResetPassword(),
        ResetDone.routeName:(context) => ResetDone(),
        Questions.routeName:(context) => Questions(),
        QuestionsDone.routeName:(context) => QuestionsDone(),
        HomeScreen.routeName:(context) => HomeScreen(),
        AllPlacesDetails.routeName:(context) => AllPlacesDetails(),
        AllGovernoratePlaces.routeName:(context) => AllGovernoratePlaces(),
        GovernoratePlacesDetails.routeName:(context) => GovernoratePlacesDetails(),


      },
    );
  }
}
