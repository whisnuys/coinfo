part of 'crypto_cubit.dart';

abstract class CryptoState extends Equatable {
  const CryptoState();

  @override
  List<Object> get props => [];
}

class CryptoInitial extends CryptoState {}

class CryptoLoading extends CryptoState {}

class CryptoLoadedSuccess extends CryptoState {
  final List<CoinModel> coins;

  const CryptoLoadedSuccess(this.coins);

  @override
  List<Object> get props => [coins];
}

class CryptoLoadedFailed extends CryptoState {
  final String error;

  const CryptoLoadedFailed(this.error);

  @override
  List<Object> get props => [error];
}
