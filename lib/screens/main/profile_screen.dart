import 'package:coinfo_app/cubit/auth_cubit.dart';
import 'package:coinfo_app/cubit/auth_cubit.dart';
import 'package:coinfo_app/widgets/account_setting_tile.dart';
import 'package:coinfo_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constant/theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 32),
              child: Image.asset(
                'assets/avatar.png',
                width: 120,
                height: 120,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 32,
              left: 24,
              right: 24,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffEAEAEA),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is AuthSuccess) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.user.username,
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        state.user.email,
                        style: greyTextStyle,
                      ),
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 27,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Column(
              children: const [
                AccountSettingTile(
                  iconUrl: 'assets/icon_check.png',
                  text: 'Account Verification',
                ),
                AccountSettingTile(
                  iconUrl: 'assets/icon_preferrence.png',
                  text: 'Preferrence',
                ),
                AccountSettingTile(
                  iconUrl: 'assets/icon_help.png',
                  text: 'Help Center',
                ),
                AccountSettingTile(
                  iconUrl: 'assets/icon_community.png',
                  text: 'Community',
                ),
              ],
            ),
          ),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthInitial) {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/login", (route) => false);
              } else if (state is AuthFailed) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red.shade700,
                    content: Text(state.error),
                  ),
                );
              }
            },
            builder: (context, state) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: CustomButton(
                  text: "Logout",
                  bgColor: kRedColor,
                  textStyle: whiteTextStyle.copyWith(
                      fontSize: 18, fontWeight: semiBold),
                  onTap: () {
                    context.read<AuthCubit>().logOut();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
