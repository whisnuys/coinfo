import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:coinfo_app/models/coin_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../constant/theme.dart';

class DetailCoinScreen extends StatelessWidget {
  final CoinModel coin;

  const DetailCoinScreen({Key? key, required this.coin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<double> data = coin.sparkLine!.map((e) => double.parse(e)).toList();
    List<FlSpot> spots = data.asMap().entries.map((e) {
      return FlSpot(e.key.toDouble(), e.value);
    }).toList();

    Widget coinTitle() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: 16,
        ),
        child: Row(
          children: [
            coin.iconUrl!.contains('.png')
                ? Image.network(
                    coin.iconUrl!,
                    width: 72,
                  )
                : SvgPicture.network(
                    coin.iconUrl!,
                    width: 72,
                  ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coin.name!,
                    style: greyTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    NumberFormat.currency(
                      locale: 'en_US',
                      symbol: '\$',
                      decimalDigits: coin.price!.toDouble() > 10 ? 2 : 10,
                    ).format(coin.price),
                    style: blackTextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              width: 78,
              height: 35,
              decoration: BoxDecoration(
                color: coin.change! < 0
                    ? kRedColor.withOpacity(.10)
                    : kGreenColor.withOpacity(.10),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Center(
                child: Text(
                  '${coin.change}%',
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
      );
    }

    Widget chartCoin() {
      return Container(
        width: double.infinity,
        height: 260,
        margin: const EdgeInsets.only(
          left: 30,
          right: 30,
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: LineChart(
          LineChartData(
            gridData: FlGridData(
              show: false,
            ),
            borderData: FlBorderData(
              show: false,
            ),
            titlesData: FlTitlesData(
              show: false,
            ),
            lineBarsData: [
              LineChartBarData(
                color: kPrimaryColor,
                spots: spots,
                isCurved: true,
                barWidth: 3,
                dotData: FlDotData(
                  show: false,
                ),
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF2972FF).withAlpha(100),
                        Color(0xFF2972FF).withAlpha(1),
                      ]),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget aboutCoin() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Value Statistics',
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: defaultMargin,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price to BTC',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    coin.btcPrice! >= 1
                        ? '${coin.btcPrice!.toStringAsFixed(2)} BTC'
                        : '${coin.btcPrice!.toStringAsFixed(15)} BTC',
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: kGreyColor,
              thickness: .8,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rank',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    coin.rank.toString(),
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: kGreyColor,
              thickness: .8,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '24h Volume',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    '\$ ${NumberFormat.compact(
                      locale: 'en_US',
                    ).format(coin.volume)}',
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: kGreyColor,
              thickness: .8,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Market Cap',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    '\$ ${NumberFormat.compact(
                      locale: 'en_US',
                    ).format(coin.marketCap)}',
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        centerTitle: true,
        leading: Container(
          width: 24,
          height: 24,
          margin: const EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: kBlackColor,
            ),
          ),
        ),
        title: Text(
          'Statistic',
          style: blackTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 18,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 14),
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/icon_bar.png',
                width: 24,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          coinTitle(),
          chartCoin(),
          aboutCoin(),
        ],
      ),
    );
  }
}
