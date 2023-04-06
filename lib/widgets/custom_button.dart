import 'package:flutter/material.dart';
import '../constant/theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final TextStyle textStyle;
  final Function() onTap;
  const CustomButton({
    Key? key,
    required this.text,
    required this.bgColor,
    required this.textStyle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 327,
        height: 56,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Center(
          child: Text(
            text,
            style: textStyle.copyWith(fontWeight: semiBold, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
