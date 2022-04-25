import 'package:flutter/material.dart';

import '../../constants/string_constants.dart';
import '../../constants/style_constants.dart';

class CountryCodeField extends StatefulWidget {
  final String selectedCode;
  final List<String> codeList;
  final Function onChanged;
  const CountryCodeField({
    Key? key,
    required this.selectedCode,
    required this.codeList,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CountryCodeField> createState() => _CountryCodeFieldState();
}

class _CountryCodeFieldState extends State<CountryCodeField> {
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
          height: 8,
        ),
        FormField<String>(
          builder: (FormFieldState<String> state) {
            return InputDecorator(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                    top: 3.0, bottom: 3, left: 8, right: 5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                enabledBorder: kBorderStyle,
              ),
              // isEmpty: _currentSelectedValue == '',
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  items: widget.codeList.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: FittedBox(child: Text(value)),
                    );
                  }).toList(),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  value: widget.selectedCode,
                  isDense: true,
                  onChanged: widget.onChanged(),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
