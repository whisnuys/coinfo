import 'package:bloc/bloc.dart';
import 'package:coinfo_app/services/user_service.dart';
import 'package:equatable/equatable.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signIn({
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());
      UserModel user =
          await AuthService().signin(email: email, password: password);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());
      UserModel user = await AuthService()
          .signup(username: username, email: email, password: password);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void logOut() async {
    try {
      emit(AuthLoading());
      await AuthService().logOut();
      emit(AuthInitial());
    } catch(e){
      emit(AuthFailed(e.toString()));
    }
  }

  void getCurrentUser(String id) async {
    try {
      UserModel user = await UserService().getUserById(id);
      emit(AuthSuccess(user));
    } catch (e){
      emit(AuthFailed(e.toString()));
    }
  }

}
