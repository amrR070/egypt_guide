import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String title;
  void Function() onPress;
  CustomButton({required this.title,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10
        ),
        child: Text(
            title,
            style: Theme.of(context).textTheme.bodySmall
        ),
      ),
    );
  }
}
