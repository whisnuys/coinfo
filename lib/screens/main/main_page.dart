import 'package:flutter/material.dart';
import '../../constant/theme.dart';
import 'news_screen.dart';
import 'notification_screen.dart';
import 'profile_screen.dart';
import 'home_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget buildContent() {
      switch (selectedIndex) {
        case 0:
          return const HomeScreen();
        case 1:
          return const NewsScreen();
        case 2:
          return const NotificationScreen();
        case 3:
          return const ProfileScreen();

        default:
          return const HomeScreen();
      }
    }

    Widget customBottomNav() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          height: 80,
          color: kWhiteColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                },
                child: Image.asset(
                  selectedIndex == 0
                      ? 'assets/icon_homeactive.png'
                      : 'assets/icon_home.png',
                  width: 24,
                  height: 24,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
                child: Image.asset(
                  selectedIndex == 1
                      ? 'assets/icon_fileactive.png'
                      : 'assets/icon_file.png',
                  width: 24,
                  height: 24,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 2;
                  });
                },
                child: Image.asset(
                  selectedIndex == 2
                      ? 'assets/icon_bellactive.png'
                      : 'assets/icon_bell.png',
                  width: 24,
                  height: 24,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 3;
                  });
                },
                child: Image.asset(
                  selectedIndex == 3
                      ? 'assets/icon_useractive.png'
                      : 'assets/icon_user.png',
                  width: 24,
                  height: 24,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          buildContent(),
          customBottomNav(),
        ],
      ),
    );
  }
}
