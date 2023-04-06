import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io' show Platform;
import '../../cubit/gainers_crypto_cubit.dart';
import '../../models/coin_model.dart';
import '../../constant/theme.dart';
import '../../widgets/crypto_card_gainer.dart';
import '../../widgets/filter_content.dart';
import '../search_delegate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? timerPeriodic;

  @override
  void initState() {
    context.read<GainersCryptoCubit>().fetchGainersCrypto();
    timerPeriodic = Timer.periodic(const Duration(minutes: 10),
        (timer) => context.read<GainersCryptoCubit>().fetchGainersCrypto());
    super.initState();
  }

  @override
  void dispose() {
    timerPeriodic?.cancel();
    super.dispose();
  }

  Widget header() {
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
        left: defaultMargin,
        right: defaultMargin,
      ),
      child: Row(
        children: [
          Text(
            'Have you invested\ntoday?',
            style: blackTextStyle.copyWith(
              fontWeight: bold,
              fontSize: 22,
            ),
          ),
          const Spacer(),
          IconButton(
            splashRadius: 20,
            onPressed: () {
              showSearch(context: context, delegate: SearchCrypto());
            },
            icon: Image.asset(
              'assets/icon_search.png',
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget gainersTitle() {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
        left: defaultMargin,
        right: defaultMargin,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Top Gainers',
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: semiBold,
            ),
          ),
        ],
      ),
    );
  }

  Widget gainers(List<CoinModel> gainerCoins) {
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: gainerCoins.map((coin) {
            return Row(
              children: [
                SizedBox(
                  width: defaultMargin,
                ),
                CryptoCardGainer(coin: coin),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            header(),
            gainersTitle(),
            BlocConsumer<GainersCryptoCubit, GainersCryptoState>(
              listener: (context, state) {
                if (state is GainersCryptoLoadedFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: kRedColor,
                      content: Text(
                        state.error,
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is GainersCryptoLoadedSuccess) {
                  return gainers(state.gainerCoins);
                }
                return Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Platform.isAndroid
                          ? const CircularProgressIndicator()
                          : const CupertinoActivityIndicator(),
                    ],
                  ),
                );
              },
            ),
            const FilterContent(),
          ],
        ),
      ),
    );
  }
}
