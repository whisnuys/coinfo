part of 'gainers_crypto_cubit.dart';

abstract class GainersCryptoState extends Equatable {
  const GainersCryptoState();

  @override
  List<Object> get props => [];
}

class GainersCryptoInitial extends GainersCryptoState {}

class GainersCryptoLoading extends GainersCryptoState {}

class GainersCryptoLoadedSuccess extends GainersCryptoState {
  final List<CoinModel> gainerCoins;

  const GainersCryptoLoadedSuccess(this.gainerCoins);

  @override
  List<Object> get props => [gainerCoins];
}

class GainersCryptoLoadedFailed extends GainersCryptoState {
  final String error;

  const GainersCryptoLoadedFailed(this.error);

  @override
  List<Object> get props => [error];
}
