import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import '../constant/theme.dart';
import '../models/coin_model.dart';
import '../screens/detail_coin_screen.dart';

class CryptoTile extends StatelessWidget {
  final CoinModel coin;

  const CryptoTile({Key? key, required this.coin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        width: double.infinity,
        height: 84,
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            coin.iconUrl!.contains('.png')
                ? Image.network(
                    coin.iconUrl!,
                    width: 36,
                  )
                : SvgPicture.network(
                    coin.iconUrl!,
                    width: 36,
                  ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    style: greyTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
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
                Expanded(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
