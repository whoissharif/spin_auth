import 'package:flutter/material.dart';
import 'package:spin_auth/constants/color_constants.dart';
import 'package:spin_auth/constants/string_constants.dart';
import 'package:spin_auth/constants/style_constants.dart';
import 'package:spin_auth/constants/urls.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Column(
                children: [
                  Image.network(
                    Urls.logoUrl,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(StringConstants.createAccount,
                      style: kHeadingTextStyle),
                  const Text(
                    StringConstants.registerToAccess,
                    style: kSubHeadingTextStyle,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
