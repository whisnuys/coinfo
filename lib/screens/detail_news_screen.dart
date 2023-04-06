import 'package:flutter/material.dart';
import '../constant/theme.dart';
import '../widgets/blur_appbar.dart';
import '../widgets/circle_tag_news.dart';

class DetailNewsScreen extends StatelessWidget {
  const DetailNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String content = '''
        Bitcoin, the world’s largest cryptocurrency by market capitalization, was down Friday by 7.6% as of press time. BTC was below the 10-hour moving average and the 50-hour, a bearish signal for market technicians.
        
        The price of BTC fell from \$39,053 at 22:30 UTC (6:30 p.m. ET) Thursday to as low as \$35,453 by 12:00 UTC (8:00 a.m. ET) Friday, a 9.2% slip based on CoinDesk 20 data.
        
        Fundamental crypto market bearishness, including uncertainty about bitcoin as an inflation hedge after U.S. President Joe Biden’s administration released a \$6 trillion budget plan as well as continuing concerns about bitcoin mining causing damage to the environment likely led to selling Friday. 
        
        “It could be a difficult weekend for crypto investors,” said David Russell, vice president of market intelligence at brokerage TradeStation Group. “The mid-May sell-off left some technical scars that may need time to heal. Bitcoin is under \$40,000 and dragging on the space.''';

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 324,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/image_newsdetail.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(
                    defaultMargin,
                  ),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        'Market Wrap: Bitcoin Slides to \$35K, ETH to \$2.4K on Biden',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          CircleTagNews(
                            colorTag: kOrangeColor,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            'BTC',
                            style: greyTextStyle,
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Text(
                            '15m ago',
                            style: greyTextStyle,
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Text(
                            'CoinDesk',
                            style: greyTextStyle,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        content,
                        style: greyTextStyle,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const BlurAppbar(),
        ],
      ),
    );
  }
}
