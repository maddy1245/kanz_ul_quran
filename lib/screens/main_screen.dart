import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:kanzul_quran/constants/constants.dart';
import 'package:kanzul_quran/screens/qari_list.dart';
import 'package:kanzul_quran/screens/home_screen.dart';
import 'package:kanzul_quran/screens/quran_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectIndex = 0;
  final List<Widget> _widgetList = [
    HomeScreen(),
    QuranScreen(),
    QariListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _widgetList[selectIndex],
        bottomNavigationBar: ConvexAppBar(
          items: [
            TabItem(
              icon: Image.asset('assets/hometab.png', color: Colors.white),
              title: 'Home',
            ),
            TabItem(
              icon: Image.asset('assets/qurantab.png', color: Colors.white),
              title: 'Quran',
            ),
            TabItem(
              icon: Image.asset('assets/voicetab.png', color: Colors.white),
              title: 'Audio',
            ),
          ],
          onTap: updateIndex,
          backgroundColor: Constants.kPrimary,
          activeColor: Constants.kPrimary,
        ),
      ),
    );
  }

  void updateIndex(index) {
    setState(() {
      selectIndex = index;
    });
  }
}
