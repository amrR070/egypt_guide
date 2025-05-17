import 'package:flutter/material.dart';
import 'package:gp/ui/login/widgets/login_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import '../../../style/reusable_components/CustomButton.dart';
import '../../../style/reusable_components/CustomTextFeild.dart';
import '../../../validation.dart';

class TourGuideRegister extends StatefulWidget {
  static const routeName = "tourGuideRegister";
  const TourGuideRegister({super.key});

  @override
  State<TourGuideRegister> createState() => _TourGuideRegisterState();
}

class _TourGuideRegisterState extends State<TourGuideRegister> {
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController birthdayController;
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmationController;

  String? selectedCountry;
  String? selectedGender;
  List<String> selectedLanguages = [];
  DateTime? selectedDate;

  PlatformFile? selectedCV;
  PlatformFile? selectedImage;

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
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    birthdayController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Tour Guide Sign Up",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
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
                  validator: (value) => Validation.fullNameValidator(value, "Should enter your name"),
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
                  decoration: _dropdownDecoration(),
                  items: genders
                      .map((gender) => DropdownMenuItem(value: gender, child: Text(gender)))
                      .toList(),
                  onChanged: (value) => setState(() => selectedGender = value),
                  validator: (value) => value == null ? "Should select your gender" : null,
                ),
                SizedBox(height: height * 0.015),
                _buildLabel("Country"),
                DropdownButtonFormField<String>(
                  value: selectedCountry,
                  decoration: _dropdownDecoration(),
                  items: countries
                      .map((country) => DropdownMenuItem(value: country, child: Text(country)))
                      .toList(),
                  onChanged: (value) => setState(() => selectedCountry = value),
                  validator: (value) => value == null ? "Should select your country" : null,
                ),
                SizedBox(height: height * 0.015),
                _buildLabel("Languages"),
                MultiSelectDialogField<String>(
                  items: languages.map((lang) => MultiSelectItem(lang, lang)).toList(),
                  title: Text("Languages"),
                  selectedColor: Colors.blue,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey.shade400,
                      width: 1,
                    ),
                  ),
                  buttonIcon: Icon(Icons.language, color: Colors.black54),
                  buttonText: Text("Select your languages", style: TextStyle(color: Colors.black54)),
                  onConfirm: (results) => selectedLanguages = results,
                  validator: (values) =>
                  (values == null || values.isEmpty) ? "Should select at least one language" : null,
                  chipDisplay: MultiSelectChipDisplay(
                    textStyle: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: height * 0.015),
                _buildLabel("Phone Number"),
                CustomFormFeild(
                  lable: "enter your phone number",
                  keyboard: TextInputType.phone,
                  controller: phoneController,
                  validator: (value) =>
                  (value == null || value.isEmpty) ? "Should enter your phone number" : null,
                ),
                SizedBox(height: height * 0.015),
                _buildLabel("Password"),
                CustomFormFeild(
                  lable: "enter your Password",
                  keyboard: TextInputType.visiblePassword,
                  controller: passwordController,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Should enter your Password";
                    if (value.length < 8) return "Password should not be less than 8 characters";
                    return null;
                  },
                ),
                SizedBox(height: height * 0.015),

                // Upload CV
                _buildLabel("Upload CV"),
                ElevatedButton(
                  onPressed: () async {
                    FilePickerResult? result = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['pdf', 'doc', 'docx'],
                    );
                    if (result != null) {
                      setState(() => selectedCV = result.files.first);
                    }
                  },
                  child: Text(selectedCV == null ? "Choose CV" : selectedCV!.name),
                ),
                if (selectedCV == null)
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                        "You must upload your CV",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 15
                        )
                    ),
                  ),
                SizedBox(height: height * 0.015),

                // Upload Image
                _buildLabel("Upload Profile Picture"),
                ElevatedButton(
                  onPressed: () async {
                    FilePickerResult? result =
                    await FilePicker.platform.pickFiles(type: FileType.image);
                    if (result != null) {
                      setState(() => selectedImage = result.files.first);
                    }
                  },
                  child: Text(selectedImage == null ? "Choose Image" : selectedImage!.name),
                ),
                if (selectedImage == null)
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                        "You must upload your image",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 15
                        )
                    ),
                  ),

                SizedBox(height: height * 0.035),
                Center(
                  child: CustomButton(
                    title: "          Sign in          ",
                    onPress: () => createAccount(),
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        LoginScreen.routeName,
                            (Route<dynamic> route) => false,
                      );
                    },
                    child: Text(
                      "Already have an account? Login",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
                    ),
                  ),
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
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  InputDecoration _dropdownDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    );
  }

  void createAccount() {
    final isValid = formKey.currentState!.validate();
    final hasCV = selectedCV != null;
    final hasImage = selectedImage != null;

    if (isValid && hasCV && hasImage) {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    } else {
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please complete all required fields")),
      );
    }
  }
}
