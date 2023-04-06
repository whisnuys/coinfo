import 'package:flutter/material.dart';
import '../constant/theme.dart';

class AccountSettingTile extends StatelessWidget {
  final String iconUrl;
  final String text;
  const AccountSettingTile({
    Key? key,
    required this.iconUrl,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 48,
        ),
        child: Row(
          children: [
            Image.asset(
              iconUrl,
              width: 24,
              height: 24,
            ),
            const SizedBox(
              width: 24,
            ),
            Expanded(
              child: Text(
                text,
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: semiBold,
                ),
              ),
            ),
            Image.asset(
              'assets/icon_chevron.png',
              width: 24,
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
