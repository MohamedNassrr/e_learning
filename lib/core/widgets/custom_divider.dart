import 'package:e_learning/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width* 0.5,
      child: Row(
        spacing: 10,
        children: [
          const Expanded(child: Divider()),
          Text(S.of(context).or),
          const Expanded(child: Divider()),
        ],
      ),
    );
  }
}
