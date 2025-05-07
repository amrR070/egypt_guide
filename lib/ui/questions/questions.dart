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
  String? destinationQ5;
  String? destinationQ6;
  String? destinationQ7;
  String? destinationQ8;
  String? destinationQ9;
  String? destinationQ10;

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
            buildQuestion(
              question: 'Q1) What is the purpose of your trip?',
              value: purpose,
              onChanged: (val) => setState(() => purpose = val),
              items: ['Business', 'Leisure', 'Other'],
            ),
            buildQuestion(
              question: 'Q2) Will you be traveling with your family?',
              value: travelingWithFamily,
              onChanged: (val) => setState(() => travelingWithFamily = val),
              items: ['Yes', 'No'],
            ),
            buildQuestion(
              question: 'Q3) What type of accommodation do you prefer?',
              value: accommodation,
              onChanged: (val) => setState(() => accommodation = val),
              items: ['Hotel', 'Hostel', 'Apartment'],
            ),
            buildQuestion(
              question: 'Q4) What type of destination are you interested in?',
              value: destinationQ4,
              onChanged: (val) => setState(() => destinationQ4 = val),
              items: ['Beach', 'Mountain', 'City'],
            ),
            buildQuestion(
              question: 'Q5) What type of destination are you interested in?',
              value: destinationQ5,
              onChanged: (val) => setState(() => destinationQ5 = val),
              items: ['Beach', 'Mountain', 'City'],
            ),
            buildQuestion(
              question: 'Q6) What type of destination are you interested in?',
              value: destinationQ6,
              onChanged: (val) => setState(() => destinationQ6 = val),
              items: ['Beach', 'Mountain', 'City'],
            ),
            buildQuestion(
              question: 'Q7) What type of destination are you interested in?',
              value: destinationQ7,
              onChanged: (val) => setState(() => destinationQ7 = val),
              items: ['Beach', 'Mountain', 'City'],
            ),
            buildQuestion(
              question: 'Q8) What type of destination are you interested in?',
              value: destinationQ8,
              onChanged: (val) => setState(() => destinationQ8 = val),
              items: ['Beach', 'Mountain', 'City'],
            ),
            buildQuestion(
              question: 'Q9) What type of destination are you interested in?',
              value: destinationQ9,
              onChanged: (val) => setState(() => destinationQ9 = val),
              items: ['Beach', 'Mountain', 'City'],
            ),
            buildQuestion(
              question: 'Q10) What type of destination are you interested in?',
              value: destinationQ10,
              onChanged: (val) => setState(() => destinationQ10 = val),
              items: ['Beach', 'Mountain', 'City'],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (purpose != null &&
                    travelingWithFamily != null &&
                    accommodation != null &&
                    destinationQ4 != null &&
                    destinationQ5 != null &&
                    destinationQ6 != null &&
                    destinationQ7 != null &&
                    destinationQ8 != null &&
                    destinationQ9 != null &&
                    destinationQ10 != null) {
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
                    color: AppColors.lightBackgroundColor
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildQuestion({
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
}
