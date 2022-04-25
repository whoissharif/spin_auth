import 'package:flutter/material.dart';
import 'package:spin_auth/constants/color_constants.dart';
import 'package:spin_auth/constants/string_constants.dart';
import 'package:spin_auth/views/widgets/otp_field.dart';

import '../widgets/my_button.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                StringConstants.verifyOtp,
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                StringConstants.verifyMsg,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 17,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const OtpField(label: StringConstants.emailOtp),
              const SizedBox(
                height: 15,
              ),
              const OtpField(label: StringConstants.phoneOtp),
              const SizedBox(
                height: 25,
              ),
              MyButton(
                  label: StringConstants.verify,
                  onPress: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return Scaffold();
                    }));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
