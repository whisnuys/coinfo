import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constant/theme.dart';
import '../models/coin_model.dart';
import '../api/coin_api.dart';
import '../widgets/crypto_tile.dart';

class SearchCrypto extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Search Crypto name or symbol';

  @override
  TextStyle? get searchFieldStyle => greyTextStyle.copyWith(
        fontSize: 16,
        fontWeight: light,
      );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(
          Icons.close,
          color: kPrimaryDark,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back_ios,
        color: kPrimaryDark,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      width: double.infinity,
      color: kBackgroundColor,
      child: Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
          bottom: 50,
        ),
        child: ListView(
          children: [
            FutureBuilder<List<CoinModel>>(
                future: CoinApi.getCoins(
                  query: query,
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
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
                  } else if (snapshot.hasData) {
                    List<CoinModel> coins = snapshot.data!;
                    return Column(
                      children: coins
                          .map((coin) => CryptoTile(
                                coin: coin,
                              ))
                          .toList(),
                    );
                  }
                  return const Text("Something went wrong");
                }),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: SizedBox(),
    );
  }
}
