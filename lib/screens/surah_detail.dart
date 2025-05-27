import 'package:flutter/material.dart';
import 'package:kanzul_quran/constants/constants.dart';
import 'package:kanzul_quran/models/translation.dart';
import 'package:kanzul_quran/services/api_services.dart';
import 'package:kanzul_quran/widgets/custom_translation.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

enum Translation { urdu, english, hindi }

class SurahDetail extends StatefulWidget {
  const SurahDetail({super.key});
  static const String id = 'surahDetail_screen';
  @override
  State<SurahDetail> createState() => _SurahDetailState();
}

class _SurahDetailState extends State<SurahDetail> {
  ApiServices apiServices = ApiServices();
  //SolidController _controller =  SolidController();
  Translation? translation = Translation.urdu;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: apiServices.getTranslation(
            Constants.surahIndex!,
            translation!.index,
          ),
          builder: (
            BuildContext context,
            AsyncSnapshot<SurahTranslationList> snapshot,
          ) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: ListView.builder(
                  itemCount: snapshot.data!.translationslist.length,
                  itemBuilder: (context, index) {
                    return TranslationTile(
                      index: index,
                      surahTranslation: snapshot.data!.translationslist[index],
                    );
                  },
                ),
              );
            } else {
              return const Center(child: Text('Translation not found'));
            }
          },
        ),

        bottomSheet: SolidBottomSheet(
          headerBar: Container(
            color: Theme.of(context).primaryColor,
            height: 50,
            child: Center(
              child: Text(
                'Swipe me to Change Language !',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          body: Container(
            color: Colors.white,
            height: 30,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text('Urdu'),
                      leading: Radio<Translation>(
                        value: Translation.urdu,
                        groupValue: translation,
                        onChanged: (Translation? value) {
                          setState(() {
                            translation = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('English'),
                      leading: Radio<Translation>(
                        value: Translation.hindi,
                        groupValue: translation,
                        onChanged: (Translation? value) {
                          setState(() {
                            translation = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('Hindi'),
                      leading: Radio<Translation>(
                        value: Translation.english,
                        groupValue: translation,
                        onChanged: (Translation? value) {
                          setState(() {
                            translation = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    // return Scaffold(
    //   body: FutureBuilder(
    //     future: apiServices.getTranslation(Constants.surahIndex!),
    //     builder: (BuildContext context, AsyncSnapshot<SurahTranslationList> snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const Center(child: CircularProgressIndicator());
    //       } else if (snapshot.hasData) {
    //         return ListView.builder(
    //           itemCount: snapshot.data!.translationslist.length,
    //           itemBuilder: (context, index) {
    //             return TranslationTile(
    //               surahTranslation: snapshot.data!.translationslist[index],
    //               index: index,
    //             );
    //           },
    //         );
    //       } else {
    //         return const Center(
    //           child: Text('Translation not found'),
    //         );
    //       }
    //     },
    //   ),
    // );
  }
}
