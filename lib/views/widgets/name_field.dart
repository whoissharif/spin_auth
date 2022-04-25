import 'package:flutter/material.dart';

import '../../constants/string_constants.dart';
import '../../constants/style_constants.dart';

class NameField extends StatelessWidget {
  const NameField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          StringConstants.name,
          style: kTFLabelTextStyle,
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(top: 3.0, bottom: 3, left: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            enabledBorder: kBorderStyle,
            suffixIcon: const Icon(
              Icons.person,
            ),
          ),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
