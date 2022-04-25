import 'package:flutter/material.dart';

import '../../constants/style_constants.dart';

class OtpFieldPhone extends StatelessWidget {
  const OtpFieldPhone({
    Key? key,
    required this.label,
    required this.controller,
  }) : super(key: key);
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
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(top: 3.0, bottom: 3, left: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            enabledBorder: kBorderStyle,
          ),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
