import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../api/coin_api.dart';
import '../models/coin_model.dart';

part 'gainers_crypto_state.dart';

class GainersCryptoCubit extends Cubit<GainersCryptoState> {
  GainersCryptoCubit() : super(GainersCryptoInitial());

  void fetchGainersCrypto() async {
    try {
      emit(GainersCryptoLoading());
      List<CoinModel> gainerCoins = await CoinApi.getGainerCoins();
      emit(GainersCryptoLoadedSuccess(gainerCoins));
    } catch (e) {
      emit(GainersCryptoLoadedFailed(e.toString()));
    }
  }
}
