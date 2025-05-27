// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:math';

import 'package:kanzul_quran/models/aya_of_the_day.dart';
import 'package:http/http.dart' as http;
import 'package:kanzul_quran/models/juz.dart';
import 'package:kanzul_quran/models/qari.dart';
import 'package:kanzul_quran/models/surah.dart';
import 'package:kanzul_quran/models/translation.dart';

class ApiServices {
  final String endPointUrl = 'https://api.alquran.cloud/v1/surah';

  List<Surah> list = [];

  Future<AyaOfTheDay> getAyaOfTheDay() async {
    String url =
        'https://api.alquran.cloud/v1/ayah/${random(1, 6237)}/editions/quran-uthmani,en.asad,en.pickthall';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return AyaOfTheDay.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Aya of the Day');
    }
  }

  random(min, max) {
    // ignore: unnecessary_new
    var rn = new Random();
    return min + rn.nextInt(max - min);
  }

  Future<List<Surah>> getSurah() async {
    http.Response res = await http.get(Uri.parse(endPointUrl));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      json['data'].forEach((element) {
        if (list.length < 114) {
          list.add(Surah.fromJson(element));
        }
      });
      // ignore: avoid_print
      print('ol ${list.length}');
      return list;
    } else {
      throw Exception('Failed to load Surah');
    }
  }

  Future<JuzModel> getJuzz(int index) async {
    String url = 'https://api.alquran.cloud/v1/juz/$index/quran-uthmani';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return JuzModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Juz');
    }
  }

  Future<SurahTranslationList> getTranslation(
    int index,
    int translationIndex,
  ) async {
    String lan = '';
    if (translationIndex == 0) {
      lan = "urdu_junagarhi";
    } else if (translationIndex == 1) {
      lan = "hindi_omari";
    } else if (translationIndex == 2) {
      lan = "english_saheeh";
    }

    String url = 'https://quranenc.com/api/translation/sura/$lan/$index';
    var res = await http.get(Uri.parse(url));
    return SurahTranslationList.fromJson(json.decode(res.body));
  }

  List<Qari> qarilist = [];
  Future<List<Qari>> getQariList() async {
    final url = "https://quranicaudio.com/api/qaris";
    final res = await http.get(Uri.parse(url));
    jsonDecode(res.body).forEach((element) {
      if (qarilist.length < 20) qarilist.add(Qari.fromjson(element));
    });
    qarilist.sort((a, b) => a.name!.compareTo(b.name!));
    return qarilist;
  }
}
