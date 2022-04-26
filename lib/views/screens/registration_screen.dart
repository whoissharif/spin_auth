import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:spin_auth/api/api_manager.dart';
import 'package:spin_auth/constants/color_constants.dart';
import 'package:spin_auth/constants/string_constants.dart';
import 'package:spin_auth/constants/style_constants.dart';
import 'package:spin_auth/constants/urls.dart';
import 'package:spin_auth/views/screens/login_screen.dart';
import 'package:spin_auth/views/screens/verification_screen.dart';
import 'package:spin_auth/views/widgets/email_field.dart';
import 'package:spin_auth/views/widgets/password_field.dart';
import 'package:spin_auth/views/widgets/phone_field.dart';

import '../widgets/my_button.dart';
import '../widgets/name_field.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool _isVisible = false;
  String _selectedCode = 'BD +88';
  final _countryCodes = [
    "AFG +93",
    "ALB +355",
    "ALG +213",
    "ARM +374",
    "BD +88",
  ];

  String errorMsg = '';

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmedPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60.0, bottom: 20.0),
                      child: Column(
                        children: [
                          Image.asset(
                            Urls.logoUrl,
                            height: 80,
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
                    flex: 5,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        children: [
                          NameField(
                            controller: nameController,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          EmailField(
                            controller: emailController,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Column(
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
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    top: 3.0,
                                                    bottom: 3,
                                                    left: 8,
                                                    right: 5),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            enabledBorder: kBorderStyle,
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              items: _countryCodes
                                                  .map((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: FittedBox(
                                                      child: Text(value)),
                                                );
                                              }).toList(),
                                              icon: const Icon(
                                                  Icons.keyboard_arrow_down),
                                              value: _selectedCode,
                                              isDense: true,
                                              onChanged: (String? value) {
                                                setState(() {
                                                  _selectedCode = value!;
                                                });
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 7,
                                child: PhoneField(controller: phoneController),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          PasswordField(
                            controller: passwordController,
                            icon: IconButton(
                              icon: Icon(!_isVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _isVisible = !_isVisible;
                                });
                              },
                            ),
                            obscureText: !_isVisible,
                            label: StringConstants.password,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          PasswordField(
                            controller: confirmedPasswordController,
                            icon: const SizedBox(),
                            obscureText: true,
                            label: StringConstants.confirmedPassword,
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
                            label: StringConstants.next,
                            onPress: () async {
                              setState(() {
                                errorMsg = '';
                              });
                              Map<String, String> body = {
                                "phoneNumber": _selectedCode.split("+").last +
                                    phoneController.text,
                                "password": passwordController.text,
                                "email": emailController.text,
                                "name": nameController.text,
                                "countryCode": _selectedCode.split(" ").first,
                              };

                              if (passwordController.text !=
                                  confirmedPasswordController.text) {
                                setState(() {
                                  errorMsg = 'Password doesn\'t matched';
                                });
                              } else {
                                Map<String, dynamic>? map;
                                log(body.toString());
                                try {
                                  map = await ApiManager().send(body);
                                } catch (e) {
                                  log(e.toString());
                                }

                                log(map.toString());

                                if (map!["statusCode"] == 400) {
                                  setState(() {
                                    errorMsg = map!["errors"][0]["msg"];
                                  });
                                } else if (map["statusCode"] == 201) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) {
                                        return VerificationScreen(
                                          prevBody: body,
                                        );
                                      },
                                    ),
                                  );
                                }
                              }
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) {
                                    return const LoginScreen();
                                  },
                                ),
                              );
                            },
                            child: const Text(StringConstants.alreadyHave),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
