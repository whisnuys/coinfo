import 'dart:ui';

import 'package:flutter/material.dart';
import '../constant/theme.dart';

class BlurAppbar extends StatelessWidget {
  const BlurAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: Container(
            padding: EdgeInsets.only(
              top: 16,
              bottom: 12,
              left: defaultMargin,
              right: defaultMargin,
            ),
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 18,
                    color: kWhiteColor,
                  ),
                ),
                Text(
                  'News Detail',
                  style: whiteTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 18,
                  ),
                ),
                Image.asset(
                  'assets/icon_share.png',
                  width: 24,
                  height: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
