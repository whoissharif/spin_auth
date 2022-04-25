import 'package:flutter/material.dart';
import 'package:spin_auth/constants/urls.dart';
import 'package:spin_auth/views/screens/registration_screen.dart';

import '../../constants/string_constants.dart';
import '../../constants/style_constants.dart';
import '../widgets/my_button.dart';
import '../widgets/password_field.dart';
import '../widgets/phone_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _selectedCode = 'BD +880';
  bool _isVisible = false;
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
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(Urls.logoUrl),
                const SizedBox(
                  height: 20,
                ),
                const Text(StringConstants.welcomeBack,
                    style: kHeadingTextStyleBlack),
                const Text(
                  StringConstants.continuewithEmail,
                  style: kSubHeadingTextStyleBlack,
                ),
                const SizedBox(
                  height: 60,
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
                                    items: _countryCodes.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: FittedBox(child: Text(value)),
                                      );
                                    }).toList(),
                                    icon: const Icon(Icons.keyboard_arrow_down),
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
                    icon: Icon(
                        !_isVisible ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                    },
                  ),
                  obscureText: !_isVisible,
                  label: StringConstants.password,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    TextButton(
                      onPressed: () {},
                      child: const Text(StringConstants.forgotPass),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                MyButton(
                  label: StringConstants.signin,
                  onPress: () {},
                ),
                const SizedBox(
                  height: 40,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                      builder: (_) {
                        return const RegistrationScreen();
                      },
                    ), (route) => false);
                  },
                  child: const Text(StringConstants.createNewAccount),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
