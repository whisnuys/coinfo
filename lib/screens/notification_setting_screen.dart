import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../constant/theme.dart';
import '../widgets/notification_setting_tile.dart';

class NotificationSetting extends StatefulWidget {
  const NotificationSetting({Key? key}) : super(key: key);

  @override
  State<NotificationSetting> createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {
  bool statusEmail = false;
  bool statusInApp = false;
  bool statusUpdateApp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        title: Text(
          'Notification Settings',
          style: blackTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            'assets/icon_chevron_left.png',
            width: 24,
            height: 24,
          ),
          splashRadius: 1,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 24,
                left: 24,
                right: 24,
              ),
              child: Text(
                'In this section, you will be able to manage notifications. We will continue to send you notifications for security reasons or if we need to contact you about your account.',
                style: greyTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            NotificationSettingTile(
              status: statusEmail,
              title: 'Email Notifications',
              desc:
                  'You will receive an email about any notification regularly.',
              onToggle: (val) {
                setState(() {
                  statusEmail = val;
                });
              },
            ),
            NotificationSettingTile(
              status: statusInApp,
              title: 'In App Notifications',
              desc: 'You will receive a notification inside the application.',
              onToggle: (val) {
                setState(() {
                  statusInApp = val;
                });
              },
            ),
            NotificationSettingTile(
              status: statusUpdateApp,
              title: 'Update Application',
              desc: 'You will receive a notification about update application.',
              onToggle: (val) {
                setState(() {
                  statusUpdateApp = val;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
