import 'package:coinfo_app/constant/theme.dart';
import 'package:coinfo_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CongratulationScreen extends StatelessWidget {
  const CongratulationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/image_step3.png',
          width: 200,
          height: 4,
        ),
        elevation: 0,
        backgroundColor: kWhiteColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 72,
                    bottom: 16,
                  ),
                  width: 300,
                  height: 172,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/image_congrats.png',
                      ),
                    ),
                  ),
                ),
                Text(
                  'Congratulations!',
                  style: blackTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'You have successfully registered on the\napplication. Please verify your identity to start\ninvesting.',
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 260,
                ),
                CustomButton(
                  text: 'Let’s go',
                  bgColor: kPrimaryColor,
                  textStyle: whiteTextStyle,
                  onTap: () {},
                ),
                const SizedBox(
                  height: 56,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
