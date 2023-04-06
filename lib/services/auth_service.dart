import 'package:coinfo_app/api/supabase_credentials.dart';
import 'package:coinfo_app/models/user_model.dart';
import 'package:coinfo_app/services/user_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  Future<UserModel> signup({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      AuthResponse userCredential = await SupabaseCredentials
          .supabaseClient.auth
          .signUp(email: email, password: password);
      UserModel user = UserModel(
          id: userCredential.user!.id,
          username: username,
          email: email,
          password: password);
      await UserService().setUser(user);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> signin({
    required String email,
    required String password,
  }) async {
    try {
      AuthResponse userCredential =
          await SupabaseCredentials.supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );

      UserModel user = await UserService().getUserById(userCredential.user!.id);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logOut() async {
    try {
      await SupabaseCredentials.supabaseClient.auth.signOut();
    } catch(e){
      rethrow;
    }
  }
}
