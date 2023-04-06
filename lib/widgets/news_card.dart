import 'dart:ui';

import 'package:flutter/material.dart';
import '../constant/theme.dart';
import 'circle_tag_news.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final Color circleColorTag;
  final String tag;
  final String time;
  final String source;
  const NewsCard({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.circleColorTag,
    required this.tag,
    required this.time,
    required this.source,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail-news');
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        width: 311,
        height: 196,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            16,
          ),
          image: DecorationImage(
            image: AssetImage(
              imageUrl,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(16),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 4.0,
                  sigmaY: 4.0,
                ),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  width: double.infinity,
                  height: 103,
                  color: kBlackColor.withOpacity(0.5),
                  child: Column(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: whiteTextStyle.copyWith(
                            fontWeight: semiBold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          CircleTagNews(
                            colorTag: circleColorTag,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            tag,
                            style: greyTextStyle,
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Text(
                            time,
                            style: greyTextStyle,
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Text(
                            source,
                            style: greyTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
