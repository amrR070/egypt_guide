import 'package:flutter/material.dart';
import 'package:gp/ui/login/widgets/login_screen.dart';

import '../../style/reusable_components/CustomButton.dart';
import '../../style/reusable_components/CustomTextFeild.dart';
import '../../validation.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = "register";
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController birthdayController;
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmationController;

  String? selectedCountry;
  String? selectedGender;
  String? selectedLanguage;
  DateTime? selectedDate;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final List<String> countries = [
    "Egypt", "USA", "Canada", "Germany", "France", "Brazil", "India", "China", "Japan", "Australia"

  ];

  final List<String> genders = ["Male", "Female"];

  final List<String> languages = [
    'Arabic', 'English', 'Spanish', 'French', 'German', 'Chinese', 'Hindi', 'Russian',
    'Portuguese', 'Bengali', 'Japanese', 'Korean', 'Turkish', 'Italian', 'Dutch',
    'Greek', 'Polish', 'Swedish', 'Norwegian', 'Finnish', 'Thai', 'Vietnamese',
    'Urdu', 'Malay', 'Indonesian', 'Hebrew', 'Persian', 'Swahili', 'Zulu', 'Romanian',
    'Czech', 'Slovak', 'Hungarian', 'Danish', 'Serbian', 'Croatian', 'Ukrainian',
    'Amharic', 'Burmese', 'Nepali', 'Pashto', 'Tamil', 'Telugu', 'Kannada', 'Gujarati',
    'Marathi', 'Punjabi', 'Sinhala', 'Khmer', 'Lao', 'Armenian', 'Azerbaijani', 'Albanian'
  ];

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    birthdayController = TextEditingController();
    passwordController = TextEditingController();
    passwordConfirmationController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    birthdayController.dispose();
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
        title: Text(
          "Create Account",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/app_icon.png",
                    height: height * 0.13,
                    width: width * 0.5,
                  ),
                ),
                SizedBox(height: height * 0.025),
                _buildLabel("Full Name"),
                CustomFormFeild(
                  lable: "enter your name",
                  keyboard: TextInputType.text,
                  controller: nameController,
                  validator: (value) {
                    return Validation.fullNameValidator(value, "Should enter your name");
                  },
                ),
                SizedBox(height: height * 0.015),
                _buildLabel("E-mail Address"),
                CustomFormFeild(
                  lable: "enter your email",
                  keyboard: TextInputType.emailAddress,
                  controller: emailController,
                  validator: Validation.emailValidator,
                ),
                SizedBox(height: height * 0.015),
                _buildLabel("Birthday"),
                CustomFormFeild(
                  lable: "select your birthday",
                  keyboard: TextInputType.datetime,
                  controller: birthdayController,
                  readOnly: true,
                  onTap: () async {
                    DateTime initial = selectedDate ?? DateTime(2000);
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: initial,
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        selectedDate = pickedDate;
                        birthdayController.text = "${pickedDate.toLocal()}".split(' ')[0];
                      });
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Should enter your birthday";
                    }
                    return null;
                  },
                ),
                SizedBox(height: height * 0.015),
                _buildLabel("Gender"),
                DropdownButtonFormField<String>(
                  value: selectedGender,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  items: genders
                      .map((gender) => DropdownMenuItem(
                    value: gender,
                    child: Text(gender),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Should select your gender";
                    }
                    return null;
                  },
                ),
                SizedBox(height: height * 0.015),
                _buildLabel("Country"),
                DropdownButtonFormField<String>(
                  value: selectedCountry,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  items: countries
                      .map((country) => DropdownMenuItem(
                    value: country,
                    child: Text(country),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCountry = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Should select your country";
                    }
                    return null;
                  },
                ),
                SizedBox(height: height * 0.015),
                _buildLabel("Language"),
                DropdownButtonFormField<String>(
                  value: selectedLanguage,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  items: languages
                      .map((language) => DropdownMenuItem(
                    value: language,
                    child: Text(language),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedLanguage = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Should select your language";
                    }
                    return null;
                  },
                ),
                SizedBox(height: height * 0.015),
                _buildLabel("Phone Number"),
                CustomFormFeild(
                  lable: "enter your phone number",
                  keyboard: TextInputType.phone,
                  controller: phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Should enter your phone number";
                    }
                    return null;
                  },
                ),
                SizedBox(height: height * 0.015),
                _buildLabel("Password"),
                CustomFormFeild(
                  lable: "enter your Password",
                  keyboard: TextInputType.visiblePassword,
                  controller: passwordController,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Should enter your Password";
                    }
                    if (value.length < 8) {
                      return "Password should not be less than 8 characters";
                    }
                    return null;
                  },
                ),
                SizedBox(height: height * 0.035),
                Center(
                  child: CustomButton(
                    title: "          Sign in          ",
                    onPress: () {
                      createAccount();
                    },
                  ),
                ),
                Center(
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(LoginScreen.routeName);
                      },
                      child: Text(
                        "Already have an account? Login",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      )),
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
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void createAccount() {
    if (formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    }
  }
}
