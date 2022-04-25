import 'package:flutter/material.dart';
import 'package:spin_auth/constants/color_constants.dart';

const TextStyle kHeadingTextStyle = TextStyle(
  fontSize: 23,
  letterSpacing: .5,
  color: Colors.white,
  fontWeight: FontWeight.w700,
);

const TextStyle kHeadingTextStyleBlack = TextStyle(
  fontSize: 30,
  letterSpacing: .5,
  color: Colors.black,
  fontWeight: FontWeight.w700,
);

const TextStyle kSubHeadingTextStyle = TextStyle(
  fontSize: 14,
  letterSpacing: .6,
  color: Colors.white,
);

const TextStyle kSubHeadingTextStyleBlack = TextStyle(
  fontSize: 12,
  letterSpacing: .6,
  color: Colors.black,
);

const TextStyle kTFLabelTextStyle = TextStyle(
  color: kTextFieldColor,
  fontWeight: FontWeight.w600,
);

const TextStyle kErrorMsgStyle = TextStyle(
  color: Colors.red,
  fontSize: 12,
);

OutlineInputBorder kBorderStyle = OutlineInputBorder(
  borderRadius: BorderRadius.circular(12.0),
  borderSide:
      const BorderSide(color: Color.fromARGB(255, 216, 216, 216), width: 1.5),
);
