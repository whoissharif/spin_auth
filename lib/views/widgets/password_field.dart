import 'package:flutter/material.dart';

import '../../constants/style_constants.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    Key? key,
    required this.icon,
    required this.obscureText,
    required this.label,
    required this.controller,
  }) : super(key: key);

  final Widget icon;
  final bool obscureText;
  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: kTFLabelTextStyle,
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(top: 3.0, bottom: 3, left: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            enabledBorder: kBorderStyle,
            suffixIcon: icon,
          ),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
