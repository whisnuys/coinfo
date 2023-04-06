import 'package:flutter/material.dart';

import '../constant/theme.dart';

class NotificationTile extends StatelessWidget {
  final bool read;
  final String imgUrl;
  final String text;
  final String time;

  const NotificationTile({
    Key? key,
    required this.read,
    required this.imgUrl,
    required this.text,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      height: 90,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          read
              ? const SizedBox(
                  width: 8,
                  height: 8,
                )
              : Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
          const SizedBox(
            width: 16,
          ),
          Image.asset(
            imgUrl,
            width: 44,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: greyTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  time,
                  style: greyTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
