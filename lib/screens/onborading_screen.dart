import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:introduction_screen/introduction_screen.dart';
import 'package:kanzul_quran/constants/constants.dart';
import 'package:kanzul_quran/screens/main_screen.dart';

class OnboradingScreen extends StatefulWidget {
  const OnboradingScreen({super.key});

  @override
  State<OnboradingScreen> createState() => _OnboradingScreenState();
}

class _OnboradingScreenState extends State<OnboradingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "Read Quran",
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Customize your reading view , read in multiple languages , listen Different Audio",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              image: Center(
                child: Image.asset('assets/quran.png', fit: BoxFit.fitWidth),
              ),
            ),
            PageViewModel(
              title: "Prayer Alerts",
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      " Choose Your adhan , which prayer to be notified of and how often .",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              image: Center(
                child: Image.asset('assets/prayer.png', fit: BoxFit.fitWidth),
              ),
            ),
            PageViewModel(
              title: "Build Better Habits",
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Make Islamic practices a part of your life in a way that best suits your life ",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              image: Center(
                child: Image.asset('assets/zakat.png', fit: BoxFit.fitWidth),
              ),
            ),
          ],
          showNextButton: true,
          next: const Icon(Icons.arrow_forward, color: Colors.black),
          done: const Text(
            "Done",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          onDone: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
          },
          onSkip: () {
            // On Skip button pressed
          },
          dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            color: Constants.kPrimary,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
      ),
    );
  }
}
