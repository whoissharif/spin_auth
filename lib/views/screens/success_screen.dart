import 'package:flutter/material.dart';
import 'package:spin_auth/constants/style_constants.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.check_circle,size: 150,),
            Text(
              'Logged In Successfully',
              style: kSubHeadingTextStyleBlack,
            )
          ],
        ),
      ),
    );
  }
}
