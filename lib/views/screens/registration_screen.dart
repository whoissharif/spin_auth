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

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

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
              child: Column(children: [
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
                          children: const [
                            Expanded(flex: 3, child: CountryCodeField()),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(flex: 6, child: PhoneField()),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const PasswordField(
                          icon: Icon(Icons.visibility),
                          obscureText: true,
                          label: StringConstants.password,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const PasswordField(
                          icon: SizedBox(),
                          obscureText: false,
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
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
