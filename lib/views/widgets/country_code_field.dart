import 'package:flutter/material.dart';

import '../../constants/string_constants.dart';
import '../../constants/style_constants.dart';

class CountryCodeField extends StatelessWidget {
  const CountryCodeField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          StringConstants.countryCode,
          style: kTFLabelTextStyle,
        ),
        const SizedBox(
          height: 12,
        ),
        TextField(
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
