import 'dart:async';

import 'package:coinfo_app/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../constant/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      User? user = Supabase.instance.client.auth.currentUser;
      if (user == null) {
        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
      } else {
        context.read<AuthCubit>().getCurrentUser(user.id);
        Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 4),
              width: 72,
              height: 72,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image_logo.png'),
                ),
              ),
            ),
            Text(
              'Coinfo',
              style: blackTextStyle.copyWith(
                fontWeight: bold,
                fontSize: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
