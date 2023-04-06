import 'package:flutter/material.dart';

import '../../constant/theme.dart';
import '../../widgets/notification_tile.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(
          top: 16,
          left: 24,
          right: 24,
        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Notifications',
              style: blackTextStyle.copyWith(
                fontSize: 22,
                fontWeight: bold,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, '/notif-setting',);
              },
              icon: Image.asset(
                'assets/icon_setting.png',
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
      );
    }

    Widget todayNotification() {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  'Mark all as read',
                  style: primaryTextStyle,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const NotificationTile(
              read: false,
              imgUrl: 'assets/btc_notif.png',
              text:
              'Bitcoin is moving up. Interested in investing? Open Coinpro now!',
              time: '10:30 AM',
            ),
            const NotificationTile(
              read: false,
              imgUrl: 'assets/upload_notif.png',
              text: 'Money deposit has been successful. Let\'s invest more.',
              time: '08:00 AM',
            ),
            const NotificationTile(
              read: true,
              imgUrl: 'assets/grt_notif.png',
              text: 'The Graph price is down, buy more coins now!',
              time: '05:59 AM',
            ),
          ],
        ),
      );
    }

    Widget anotherDayNotification() {
      return Padding(
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
          bottom: 24,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '20 Apr 2021',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const NotificationTile(
              read: true,
              imgUrl: 'assets/btc_notif.png',
              text:
              'Bitcoin is moving up. Interested in investing? Open Coinpro now!',
              time: '10:30 AM',
            ),
            const NotificationTile(
              read: true,
              imgUrl: 'assets/sushi_notif.png',
              text:
              'SushiSwap is moving up. Interested in investing? Open Coinpro now!',
              time: '11:00 PM',
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: ListView(
        children: [
          header(),
          todayNotification(),
          anotherDayNotification(),
        ],
      ),
    );
  }
}
