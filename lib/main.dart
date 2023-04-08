import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'api/supabase_credentials.dart';
import 'cubit/auth_cubit.dart';
import 'cubit/crypto_cubit.dart';
import 'cubit/gainers_crypto_cubit.dart';
import 'screens/congratulation_screen.dart';
import 'screens/detail_news_screen.dart';
import 'screens/login_screen.dart';
import 'screens/main/main_page.dart';
import 'screens/notification_setting_screen.dart';
import 'screens/register_screen.dart';
import 'screens/setpin_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/verify_email_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: SupabaseCredentials.APIURL,
    anonKey: SupabaseCredentials.APIKEY,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CryptoCubit(),
        ),
        BlocProvider(
          create: (context) => GainersCryptoCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => const SplashScreen(),
          "/register": (context) => const RegisterScreen(),
          "/login": (context) => const LoginScreen(),
          "/verifemail": (context) => const VerifyEmailScreen(),
          "/setpin": (context) => const SetpinScreen(),
          "/congrats": (context) => const CongratulationScreen(),
          "/main": (context) => const MainPage(),
          "/detail-news": (context) => const DetailNewsScreen(),
          "/notif-setting": (context) => const NotificationSetting(),
        },
      ),
    );
  }
}
