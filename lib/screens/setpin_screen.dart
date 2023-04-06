import 'package:coinfo_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../constant/theme.dart';

class SetpinScreen extends StatefulWidget {
  const SetpinScreen({Key? key}) : super(key: key);

  @override
  State<SetpinScreen> createState() => _SetpinScreenState();
}

class _SetpinScreenState extends State<SetpinScreen> {
  final TextEditingController setpinController =
      TextEditingController(text: '');
  final TextEditingController setpinConfirmController =
      TextEditingController(text: '');

  bool pinVisible = true;
  bool pinConfirmVisible = true;
  void togglePinVisible() {
    setState(() {
      pinVisible = !pinVisible;
    });
  }

  void togglePinConfirmVisible() {
    setState(() {
      pinConfirmVisible = !pinConfirmVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/image_step2.png',
          width: 200,
          height: 4,
        ),
        elevation: 0,
        backgroundColor: kWhiteColor,
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            Form(
              child: Column(
                children: [
                  const SizedBox(
                    height: 48,
                  ),
                  Text(
                    'Set your PIN',
                    style: blackTextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    'Set your PIN, this PIN is used every time you\nenter the application.',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  // InputField(
                  //   hintText: 'PIN',
                  //   suffixIcon: IconButton(
                  //     splashRadius: 1,
                  //     color: kGreyColor,
                  //     onPressed: togglePinVisible,
                  //     icon: Icon(
                  //       pinVisible
                  //           ? Icons.visibility_off_outlined
                  //           : Icons.visibility_outlined,
                  //     ),
                  //   ),
                  //   obscureText: pinVisible,
                  //   controller: setpinController,
                  //   type: TextInputType.number,
                  // ),
                  // const SizedBox(
                  //   height: 32,
                  // ),
                  // InputField(
                  //   hintText: 'PIN Confirmation',
                  //   suffixIcon: IconButton(
                  //     splashRadius: 1,
                  //     color: kGreyColor,
                  //     onPressed: togglePinConfirmVisible,
                  //     icon: Icon(
                  //       pinConfirmVisible
                  //           ? Icons.visibility_off_outlined
                  //           : Icons.visibility_outlined,
                  //     ),
                  //   ),
                  //   obscureText: pinConfirmVisible,
                  //   controller: setpinConfirmController,
                  //   type: TextInputType.number,
                  // ),
                ],
              ),
            ),
            const SizedBox(
              height: 217,
            ),
            CustomButton(
              text: 'Continue',
              bgColor: kPrimaryColor,
              textStyle: whiteTextStyle,
              onTap: () {},
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: 'Skip',
              bgColor: kBackgroundColor,
              textStyle: blackTextStyle,
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/congrats', (route) => false);
              },
            ),
            const SizedBox(
              height: 56,
            ),
          ],
        ),
      ),
    );
  }
}
