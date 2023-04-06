import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constant/theme.dart';
import '../cubit/crypto_cubit.dart';
import 'crypto_tile.dart';

class FilterContent extends StatefulWidget {
  final String selectedFilter;
  const FilterContent({Key? key, this.selectedFilter = 'marketCap'})
      : super(key: key);

  @override
  State<FilterContent> createState() => _FilterContentState();
}

class _FilterContentState extends State<FilterContent> {
  String selectFilter = 'marketCap';
  Timer? timerPeriodic;

  @override
  void initState() {
    context.read<CryptoCubit>().fetchCrypto();
    selectFilter = widget.selectedFilter;
    // Auto refresh
    timerPeriodic = Timer.periodic(
        const Duration(minutes: 10),
        (timer) =>
            context.read<CryptoCubit>().fetchCrypto(filter: selectFilter));
    super.initState();
  }

  @override
  void dispose() {
    timerPeriodic?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // NOTE: Filter Category
        Container(
          margin: const EdgeInsets.only(top: 24),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: defaultMargin,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectFilter = 'marketCap';
                      context
                          .read<CryptoCubit>()
                          .fetchCrypto(filter: selectFilter);
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    height: 33,
                    decoration: BoxDecoration(
                      color: selectFilter == 'marketCap'
                          ? kPrimaryColor
                          : kBackgroundColor2,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: selectFilter == 'marketCap'
                          ? [
                              BoxShadow(
                                color: kPrimaryColor.withOpacity(0.5),
                                spreadRadius: 0.5,
                                blurRadius: 5,
                                offset: const Offset(0, 2),
                              ),
                            ]
                          : [],
                    ),
                    child: Center(
                      child: Text(
                        'Market Cap',
                        style: selectFilter == 'marketCap'
                            ? whiteTextStyle.copyWith(
                                fontWeight: semiBold,
                              )
                            : blackTextStyle,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectFilter = '24hVolume';
                      context
                          .read<CryptoCubit>()
                          .fetchCrypto(filter: selectFilter);
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    height: 33,
                    decoration: BoxDecoration(
                      color: selectFilter == '24hVolume'
                          ? kPrimaryColor
                          : kBackgroundColor2,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: selectFilter == '24hVolume'
                          ? [
                              BoxShadow(
                                color: kPrimaryColor.withOpacity(0.5),
                                spreadRadius: 0.5,
                                blurRadius: 5,
                                offset: const Offset(0, 2),
                              ),
                            ]
                          : [],
                    ),
                    child: Center(
                      child: Text(
                        '24hVolume',
                        style: selectFilter == '24hVolume'
                            ? whiteTextStyle.copyWith(
                                fontWeight: semiBold,
                              )
                            : blackTextStyle,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectFilter = 'price';
                      context
                          .read<CryptoCubit>()
                          .fetchCrypto(filter: selectFilter);
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    height: 33,
                    decoration: BoxDecoration(
                      color: selectFilter == 'price'
                          ? kPrimaryColor
                          : kBackgroundColor2,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: selectFilter == 'price'
                          ? [
                              BoxShadow(
                                color: kPrimaryColor.withOpacity(0.5),
                                spreadRadius: 0.5,
                                blurRadius: 5,
                                offset: const Offset(0, 2),
                              ),
                            ]
                          : [],
                    ),
                    child: Center(
                      child: Text(
                        'Price',
                        style: selectFilter == 'price'
                            ? whiteTextStyle.copyWith(
                                fontWeight: semiBold,
                              )
                            : blackTextStyle,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectFilter = 'listedAt';
                      context
                          .read<CryptoCubit>()
                          .fetchCrypto(filter: selectFilter);
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    height: 33,
                    decoration: BoxDecoration(
                      color: selectFilter == 'listedAt'
                          ? kPrimaryColor
                          : kBackgroundColor2,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: selectFilter == 'listedAt'
                          ? [
                              BoxShadow(
                                color: kPrimaryColor.withOpacity(0.5),
                                spreadRadius: 0.5,
                                blurRadius: 5,
                                offset: const Offset(0, 2),
                              ),
                            ]
                          : [],
                    ),
                    child: Center(
                      child: Text(
                        'listedAt',
                        style: selectFilter == 'listedAt'
                            ? whiteTextStyle.copyWith(
                                fontWeight: semiBold,
                              )
                            : blackTextStyle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // NOTE: Filter Content
        BlocConsumer<CryptoCubit, CryptoState>(
          listener: (context, state) {
            if (state is CryptoLoadedFailed) {
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
            if (state is CryptoLoadedSuccess) {
              return Container(
                margin: EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin,
                  bottom: 50,
                ),
                child: Column(
                  children: state.coins.map((coin) {
                    return CryptoTile(coin: coin);
                  }).toList(),
                ),
              );
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
      ],
    );
  }
}
