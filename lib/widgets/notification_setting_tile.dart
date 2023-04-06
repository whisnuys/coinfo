import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../constant/theme.dart';

class NotificationSettingTile extends StatelessWidget {
  final bool status;
  final String title;
  final String desc;
  final Function(bool) onToggle;

  const NotificationSettingTile({
    Key? key,
    required this.status,
    required this.title,
    required this.desc,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24, top: 32,),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: blackTextStyle.copyWith(fontSize: 16),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  desc,
                  style: greyTextStyle,
                ),
              ],
            ),
          ),
          FlutterSwitch(
            width: 58,
            height: 32,
            activeColor: kPrimaryColor,
            value: status,
            onToggle: (val){
              onToggle(val);
            },
          ),
        ],
      ),
    );
  }
}
