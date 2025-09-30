import 'package:flutter/material.dart';

class CustomRegisterLoginButton extends StatelessWidget {
  const CustomRegisterLoginButton({super.key, required this.text, required this.onPressed, required this.pressableText});



  final String text;
  final Function() onPressed;
  final String pressableText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 2,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w100,
          ),
        ),
        InkWell(
          onTap: onPressed,
          child: Text(
           pressableText,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
