import 'package:flutter/material.dart';

class CustomFormFeild extends StatefulWidget {
  final String lable;
  final TextInputType keyboard;
  final TextEditingController controller;
  final bool isPassword;
  final String? Function(String?) validator;

  final bool readOnly;
  final VoidCallback? onTap;

  CustomFormFeild({
    required this.lable,
    required this.keyboard,
    required this.controller,
    this.isPassword = false,
    required this.validator,
    this.readOnly = false,
    this.onTap,
  });

  @override
  State<CustomFormFeild> createState() => _CustomFormFeildState();
}

class _CustomFormFeildState extends State<CustomFormFeild> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboard,
      validator: widget.validator,
      controller: widget.controller,
      obscureText: widget.isPassword ? !isVisible : false,
      obscuringCharacter: "*",
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      style: Theme.of(context).textTheme.titleLarge,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        fillColor: Colors.white,
        filled: true,
        suffix: widget.isPassword
            ? IconButton(
          onPressed: () {
            setState(() {
              isVisible = !isVisible;
            });
          },
          icon: Icon(
            isVisible
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: Colors.grey,
          ),
        )
            : null,
        labelText: widget.lable,
        labelStyle: Theme.of(context).textTheme.labelSmall,
      ),
    );
  }
}
