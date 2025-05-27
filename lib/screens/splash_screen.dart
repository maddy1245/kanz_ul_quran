import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kanzul_quran/screens/main_screen.dart';
import 'package:kanzul_quran/screens/onborading_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool alreadySeen = false;
  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    alreadySeen = prefs.getBool("alreadySeen") ?? false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return alreadySeen? MainScreen(): OnboradingScreen();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Text(
                'Kanz-ul-Quran',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset('assets/splash.png'),
            ),
          ],
        ),
      ),
    );
  }
}
