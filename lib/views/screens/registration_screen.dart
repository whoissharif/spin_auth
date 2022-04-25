import 'package:flutter/material.dart';
import 'package:spin_auth/constants/color_constants.dart';
import 'package:spin_auth/constants/string_constants.dart';
import 'package:spin_auth/constants/style_constants.dart';
import 'package:spin_auth/constants/urls.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          StringConstants.name,
                          style: kTFLabelTextStyle,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextField(
                          decoration: InputDecoration(
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
