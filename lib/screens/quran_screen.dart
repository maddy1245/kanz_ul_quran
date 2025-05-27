import 'package:flutter/material.dart';
import 'package:kanzul_quran/constants/constants.dart';
import 'package:kanzul_quran/models/surah.dart';
import 'package:kanzul_quran/screens/juz_screen.dart';
import 'package:kanzul_quran/screens/surah_detail.dart';
import 'package:kanzul_quran/services/api_services.dart';
import 'package:kanzul_quran/widgets/surah_custom_tile.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Constants.kPrimary,
            title: const Text(
              'Quran',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            centerTitle: true,
            bottom: const TabBar(
              tabs: [
                Text(
                  'Surah',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),

                Text(
                  'Juz',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              FutureBuilder(
                future: apiServices.getSurah(),
                builder: (context, AsyncSnapshot<List<Surah>> snapshot) {
                  if (snapshot.hasData) {
                    List<Surah>? surah = snapshot.data;
                    return ListView.builder(
                      itemCount: surah!.length,
                      itemBuilder:
                          (context, index) => surahCustomListTile(
                            surah: surah[index],
                            context: context,
                            ontap: () {
                              setState(() {
                                Constants.surahIndex = index + 1;
                              });
                              Navigator.pushNamed(context, SurahDetail.id);
                            },
                          ),
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),

              // FutureBuilder(
              //   future: apiServices.getSurah(),
              //   builder: (
              //     BuildContext context,
              //     AsyncSnapshot<List<Surah>> snapshot,
              //   ) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return const Center(child: CircularProgressIndicator());
              //     } else if (snapshot.hasError) {
              //       return Center(child: Text('Error: ${snapshot.error}'));
              //     } else if (snapshot.hasData) {
              //       List<Surah>? surah = snapshot.data;
              //       return ListView.builder(
              //         itemCount: surah?.length ?? 0,
              //         itemBuilder:
              //             (context, index) => surahCustomListTile(
              //               surah: surah![index],
              //               context: context,
              //               ontap: () {},
              //             ),
              //       );
              //     } else {
              //       return const Center(child: Text('No data found.'));
              //     }
              //   },
              // ),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: 30,

                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            Constants.juzIndex = index + 1;
                          });
                          Navigator.pushNamed(context, JuzScreen.id);
                        },
                        child: Card(
                          elevation: 4,
                          color: Constants.kPrimary,
                          child: Center(
                            child: Text(
                              'Juz ${index + 1}',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
