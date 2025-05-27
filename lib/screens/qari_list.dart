import 'package:flutter/material.dart';
import 'package:kanzul_quran/models/qari.dart';
import 'package:kanzul_quran/screens/audio_surah_screen.dart';
import 'package:kanzul_quran/services/api_services.dart';
import 'package:kanzul_quran/widgets/qari_custom_tile.dart';

class QariListScreen extends StatefulWidget {
  const QariListScreen({super.key});

  @override
  State<QariListScreen> createState() => _QariListScreenState();
}

class _QariListScreenState extends State<QariListScreen> {
  ApiServices apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Qari\'s '), centerTitle: true),
        body: Padding(
          padding: EdgeInsets.only(top: 20, left: 12, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12),
              Expanded(
                child: FutureBuilder(
                  future: apiServices.getQariList(),
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<List<Qari>> snapshot,
                  ) {
                    if (snapshot.hasError) {
                      return Center(child: Text('Qari\'s data has not found'));
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return QariCustomTile(
                          qari: snapshot.data![index],
                          ontap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => AudioSurahScreen(
                                      qari: snapshot.data![index],
                                    ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
