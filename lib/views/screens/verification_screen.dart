import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:spin_auth/constants/color_constants.dart';
import 'package:spin_auth/constants/string_constants.dart';
import 'package:spin_auth/views/screens/login_screen.dart';
import 'package:spin_auth/views/widgets/otp_field_email.dart';
import 'package:spin_auth/views/widgets/otp_field_phone.dart';

import '../../api/api_manager.dart';
import '../../constants/style_constants.dart';
import '../widgets/my_button.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key, required this.prevBody})
      : super(key: key);

  final Map<String, String> prevBody;

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController emailOTPController = TextEditingController();

  TextEditingController phoneOTPController = TextEditingController();

  String errorMsg = '';

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
                height: 10,
              ),
              Text(
                errorMsg,
                style: kErrorMsgStyle,
              ),
              const SizedBox(
                height: 30,
              ),
              MyButton(
                label: StringConstants.verify,
                onPress: () async {
                  Map<String, dynamic>? map;
                  Map<String, String> body = widget.prevBody
                    ..addAll({
                      "otpNumberForEmail": emailOTPController.text,
                      "otpNumberForPhone": phoneOTPController.text,
                    });
                  try {
                    map = await ApiManager().register(body);
                    log(body.toString());
                    log(map.toString());
                  } catch (e) {
                    log(e.toString());
                  }

                  if (map!["statusCode"] == 400) {
                    setState(() {
                      errorMsg = map!["errors"][0]["msg"];
                    });
                  } else if (map["statusCode"] == 201) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) {
                          return const LoginScreen();
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
