import 'package:flutter/material.dart';

class CircleTagNews extends StatelessWidget {
  final Color colorTag;
  const CircleTagNews({Key? key, required this.colorTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          100,
        ),
        color: colorTag,
      ),
    );
  }
}
