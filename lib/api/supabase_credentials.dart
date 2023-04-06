// ignore_for_file: constant_identifier_names

import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseCredentials {
  static const String APIKEY = "your-supabase-apikey";
  static const String APIURL = "your-supabase-apiurl";

  static SupabaseClient supabaseClient = SupabaseClient(APIURL, APIKEY);
}
