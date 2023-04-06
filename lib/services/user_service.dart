import 'package:coinfo_app/api/supabase_credentials.dart';
import 'package:coinfo_app/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserService {
  final SupabaseQueryBuilder _userReference =
      SupabaseCredentials.supabaseClient.from('profiles');

  Future<void> setUser(UserModel user) async {
    try {
      await _userReference.insert(
        {
          'id': user.id,
          'username': user.username,
          'email': user.email,
          'password': user.password,
        },
      ).execute();
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getUserById(String id) async {
    try {
      final user = await _userReference.select().eq('id', id).execute();

      return UserModel(
          id: id,
          username: user.data![0]['username'],
          email: user.data![0]['email'],
          password: user.data![0]['password']);
    } catch (e) {
      rethrow;
    }
  }
}
