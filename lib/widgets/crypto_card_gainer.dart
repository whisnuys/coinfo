import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../constant/theme.dart';
import '../models/coin_model.dart';
import '../screens/detail_coin_screen.dart';

class CryptoCardGainer extends StatelessWidget {
  final CoinModel coin;

  const CryptoCardGainer({
    Key? key,
    required this.coin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<double> data = coin.sparkLine!.map((e) => double.parse(e)).toList();
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailCoinScreen(
              coin: coin,
            ),
          ),
        );
      },
      child: Container(
        width: 236,
        height: 147,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Row(
              children: [
                coin.iconUrl!.contains('.png')
                    ? Image.network(
                        coin.iconUrl!,
                        width: 36,
                        height: 36,
                      )
                    : SvgPicture.network(
                        coin.iconUrl!,
                        width: 36,
                        height: 36,
                      ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        coin.name!,
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        coin.symbol!,
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        NumberFormat.currency(
                          locale: 'en_US',
                          symbol: '\$',
                          decimalDigits: coin.price!.toDouble() > 10 ? 2 : 6,
                        ).format(coin.price),
                        style: blackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: semiBold,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        width: 64,
                        height: 25,
                        decoration: BoxDecoration(
                          color: coin.change! < 0
                              ? kRedColor.withOpacity(.10)
                              : kGreenColor.withOpacity(.10),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                          child: Text(
                            coin.change! < 0
                                ? '${coin.change}%'
                                : '+${coin.change}%',
                            style: coin.change! < 0
                                ? redTextStyle.copyWith(
                                    fontWeight: semiBold,
                                  )
                                : greenTextStyle.copyWith(
                                    fontWeight: semiBold,
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 85,
                  height: 63,
                  child: Sparkline(
                    data: data,
                    useCubicSmoothing: true,
                    cubicSmoothingFactor: 0.2,
                    lineColor: kGreenColor,
                    fillMode: FillMode.below,
                    fillGradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [kGreenColor.withOpacity(0.3), kWhiteColor],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
