import 'package:flutter/material.dart';
import 'package:kanzul_quran/constants/constants.dart';
import 'package:kanzul_quran/screens/juz_screen.dart';
import 'package:kanzul_quran/screens/splash_screen.dart';
import 'package:kanzul_quran/screens/surah_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kanz-ul-Quran',
      theme: ThemeData(
        primarySwatch: Constants.kSwatchColor,
        fontFamily: 'Poppins',
      ),
      home: const SplashScreen(),
      routes: {
        JuzScreen.id: (context) => JuzScreen(),
        SurahDetail.id: (context) => SurahDetail(),
      },
    );
  }
}
