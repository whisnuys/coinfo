import 'package:flutter/material.dart';
import '../constant/theme.dart';
import 'circle_tag_news.dart';

class NewsTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  final Color circleColorTag;
  final String tag;
  final String time;
  final String source;
  const NewsTile({
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
        width: double.infinity,
        height: 110,
        margin: const EdgeInsets.only(
          bottom: 16,
        ),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(
              0xFFEAEAEA,
            ),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
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
            const SizedBox(
              width: 16,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imageUrl,
                  width: 70,
                  height: 72,
                )),
          ],
        ),
      ),
    );
  }
}
