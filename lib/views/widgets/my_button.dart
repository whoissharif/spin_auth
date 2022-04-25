import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';
import '../../constants/string_constants.dart';


class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            color: kButtonColor, borderRadius: BorderRadius.circular(12)),
        child: const Center(
          child: Text(
            StringConstants.next,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
