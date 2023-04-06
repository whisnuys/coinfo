import 'package:flutter/material.dart';
import '../../constant/theme.dart';
import '../../widgets/news_card.dart';
import '../../widgets/news_tile.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

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
              'Top News',
              style: blackTextStyle.copyWith(
                fontSize: 22,
                fontWeight: bold,
              ),
            ),
            Image.asset(
              'assets/icon_slider.png',
              width: 24,
              height: 24,
            ),
          ],
        ),
      );
    }

    Widget topNews() {
      return Container(
        margin: const EdgeInsets.only(top: 32),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              NewsCard(
                title:
                    'Market Wrap: Bitcoin Slides to \$35K, ETH to \$2.4K on Biden',
                imageUrl: 'assets/image_news1.png',
                circleColorTag: kOrangeColor,
                tag: 'BTC',
                time: '15m ago',
                source: 'CoinDesk',
              ),
              NewsCard(
                title:
                    'Market Wrap: Bitcoin Slides to \$35K, ETH to \$2.4K on Biden',
                imageUrl: 'assets/image_news2.png',
                circleColorTag: kOrangeColor,
                tag: 'BTC',
                time: '15m ago',
                source: 'CoinDesk',
              ),
              const SizedBox(
                width: 8,
              ),
            ],
          ),
        ),
      );
    }

    Widget recommendedNews() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recommended News',
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            NewsTile(
              title:
                  'REN Price Climbs to Record High, Benefiting From Ethereum Congestion',
              imageUrl: 'assets/image_news3.png',
              circleColorTag: kPrimaryColor,
              tag: 'REN',
              time: '57m ago',
              source: 'CNBC',
            ),
            NewsTile(
              title: 'Binance Coin Price Update This Week',
              imageUrl: 'assets/image_news4.png',
              circleColorTag: kOrangeColor,
              tag: 'BNB',
              time: '1h ago',
              source: 'Binance',
            ),
            NewsTile(
              title: '5 Advantages of Investing in The Graph',
              imageUrl: 'assets/image_news5.png',
              circleColorTag: kPurpleColor,
              tag: 'GRT',
              time: '3h ago',
              source: 'CNN',
            ),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: ListView(
        children: [
          header(),
          topNews(),
          recommendedNews(),
        ],
      ),
    );
  }
}
