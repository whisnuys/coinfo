import 'package:bloc/bloc.dart';
import 'package:coinfo_app/api/coin_api.dart';
import 'package:coinfo_app/models/coin_model.dart';
import 'package:equatable/equatable.dart';

part 'crypto_state.dart';

class CryptoCubit extends Cubit<CryptoState> {
  CryptoCubit() : super(CryptoInitial());

  void fetchCrypto({String query = '', String filter = 'marketCap'}) async {
    try {
      emit(CryptoLoading());
      List<CoinModel> coins = await CoinApi.getCoins(
        query: query,
        orderBy: filter,
      );
      emit(CryptoLoadedSuccess(coins));
    } catch (e) {
      emit(CryptoLoadedFailed(e.toString()));
    }
  }
}
