import 'package:flutter/material.dart';
import 'package:spin_auth/constants/color_constants.dart';
import 'package:spin_auth/constants/string_constants.dart';
import 'package:spin_auth/constants/style_constants.dart';
import 'package:spin_auth/constants/urls.dart';
import 'package:spin_auth/views/widgets/country_code_field.dart';
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
  String _selectedCode = 'BD +880';
  final _countryCodes = [
    "AFG +93",
    "ALB +355",
    "ALG +213",
    "ARM +374",
    "BD +880",
  ];

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
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 45.0),
                        child: Column(
                          children: [
                            Image.network(
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
                          const NameField(),
                          const SizedBox(
                            height: 15,
                          ),
                          const EmailField(),
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
                                          // isEmpty: _currentSelectedValue == '',
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
                              const Expanded(flex: 7, child: PhoneField()),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          PasswordField(
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
                          const PasswordField(
                            icon: SizedBox(),
                            obscureText: true,
                            label: StringConstants.confirmedPassword,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const MyButton()
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
