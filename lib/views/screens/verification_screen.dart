import 'package:flutter/material.dart';
import 'package:spin_auth/constants/color_constants.dart';
import 'package:spin_auth/constants/string_constants.dart';
import 'package:spin_auth/views/screens/login_screen.dart';
import 'package:spin_auth/views/widgets/otp_field_email.dart';
import 'package:spin_auth/views/widgets/otp_field_phone.dart';

import '../widgets/my_button.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({Key? key}) : super(key: key);

  TextEditingController emailOTPController = TextEditingController();
  TextEditingController phoneOTPController = TextEditingController();

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
              OtpFieldEmail(
                label: StringConstants.emailOtp,
                controller: emailOTPController,
              ),
              const SizedBox(
                height: 15,
              ),
              OtpFieldPhone(
                label: StringConstants.phoneOtp,
                controller: phoneOTPController,
              ),
              const SizedBox(
                height: 30,
              ),
              MyButton(
                label: StringConstants.verify,
                onPress: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        return const LoginScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
