import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.type,
    this.onSubmit,
    this.radius = 14,
     this.validation,
    this.suffix,
    this.suffixPressed,
    this.isPassword = false, this.onChanged,
    this.hintStyle,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType type;
  final Function(String)? onSubmit;
  final Function(String)? onChanged;
  final Function()? suffixPressed;
  final FormFieldValidator<String>? validation;
  final double radius;
  final IconData? suffix;
  final TextStyle? hintStyle;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      onChanged: onChanged,
      onFieldSubmitted: onSubmit,
      obscureText: isPassword,
      validator: validation,
      decoration: InputDecoration(
        focusedBorder: buildOutlineInputBorder(),
        border: buildOutlineInputBorder(),
        hintText: hintText,
        hintStyle: hintStyle,
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
    );
  }
}