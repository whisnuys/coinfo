import 'package:flutter/material.dart';
import '../constant/theme.dart';
import '../widgets/custom_button.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/image_step1.png',
          width: 200,
          height: 4,
        ),
        elevation: 0,
        backgroundColor: kWhiteColor,
      ),
      body: SafeArea(
        child: Center(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 16,
                      top: 72,
                    ),
                    width: 300,
                    height: 233,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/image_verifemail.png',
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Verify your email',
                    style: blackTextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'We sent a verification code to your email.\nPlease tap the link inside that email to\ncontinue.',
                    textAlign: TextAlign.center,
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(
                    height: 116,
                  ),
                ],
              ),
              CustomButton(
                text: 'Check my inbox',
                bgColor: kPrimaryColor,
                textStyle: whiteTextStyle,
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/setpin', (route) => false);
                },
              ),
              const SizedBox(
                height: 24,
              ),
              CustomButton(
                text: 'Resend Email',
                bgColor: kWhiteGrey,
                textStyle: blackTextStyle,
                onTap: () {},
              ),
              const SizedBox(
                height: 56,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
