import 'package:flutter/material.dart';
import 'package:gp/ui/questions/questions_done.dart';

import '../../style/AppColors.dart';

class Questions extends StatefulWidget {
  static const routeName = "questions";

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  String? purpose;
  String? travelingWithFamily;
  String? accommodation;
  String? destinationQ4;

  TextEditingController daysController = TextEditingController();
  TextEditingController budgetController = TextEditingController();
  TextEditingController travelCountController = TextEditingController();
  TextEditingController accommodationCostController = TextEditingController();
  TextEditingController transportationCostController = TextEditingController();
  TextEditingController foodCostController = TextEditingController();
  TextEditingController dailyCostController = TextEditingController();

  @override
  void dispose() {
    daysController.dispose();
    budgetController.dispose();
    travelCountController.dispose();
    accommodationCostController.dispose();
    transportationCostController.dispose();
    foodCostController.dispose();
    dailyCostController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Machine Quotations'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildDropdownQuestion(
              question: 'Q1) What is the purpose of your trip?',
              value: purpose,
              onChanged: (val) => setState(() => purpose = val),
              items: [
                "Business",
                "Education",
                "Leisure",
                "Medical",
              ],
            ),
            buildDropdownQuestion(
              question: 'Q2) Will you be traveling with your family?',
              value: travelingWithFamily,
              onChanged: (val) => setState(() => travelingWithFamily = val),
              items: ["With Family", "Without Family"],
            ),
            buildDropdownQuestion(
              question: 'Q3) What type of accommodation do you prefer?',
              value: accommodation,
              onChanged: (val) => setState(() => accommodation = val),
              items: ["Airbnb", "Hostel", "Hotel", "Resort"],
            ),
            buildDropdownQuestion(
              question: 'Q4) What type of destination are you interested in?',
              value: destinationQ4,
              onChanged: (val) => setState(() => destinationQ4 = val),
              items: [
                "Adventure Park",
                "Beach",
                "City",
                "Countryside",
                "Mountain"
              ],
            ),
            buildTextQuestion(
              question: 'Q5) How many days do you plan to stay?',
              controller: daysController,
            ),
            buildTextQuestion(
              question: 'Q6) How much do you plan to spend (in USD)?',
              controller: budgetController,
            ),
            buildTextQuestion(
              question:
              'Q7) Please enter how many times you travel annually (1–100).',
              controller: travelCountController,
            ),
            buildTextQuestion(
              question:
              'Q8) What is your average spending on accommodation per trip (in USD)?',
              controller: accommodationCostController,
            ),
            buildTextQuestion(
              question:
              'Q9) What is your average spending on transportation per trip (in USD)?',
              controller: transportationCostController,
            ),
            buildTextQuestion(
              question:
              'Q10) What is your average spending on food per trip (in USD)?',
              controller: foodCostController,
            ),
            buildTextQuestion(
              question:
              'Q11) What is your average cost per day during your trip (in AED)?',
              controller: dailyCostController,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (purpose != null &&
                    travelingWithFamily != null &&
                    accommodation != null &&
                    destinationQ4 != null &&
                    daysController.text.isNotEmpty &&
                    budgetController.text.isNotEmpty &&
                    travelCountController.text.isNotEmpty &&
                    accommodationCostController.text.isNotEmpty &&
                    transportationCostController.text.isNotEmpty &&
                    foodCostController.text.isNotEmpty &&
                    dailyCostController.text.isNotEmpty) {
                  Navigator.pushReplacementNamed(
                      context, QuestionsDone.routeName);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please answer all the questions.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: const Text(
                'Confirm',
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: AppColors.lightBackgroundColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDropdownQuestion({
    required String question,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            value: value,
            items: items
                .map((item) => DropdownMenuItem(
              value: item,
              child: Text(item),
            ))
                .toList(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget buildTextQuestion({
    required String question,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your answer',
            ),
          ),
        ],
      ),
    );
  }
}
