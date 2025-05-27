class SurahTranslationList {
  final List<SurahTranslation> translationslist;

  SurahTranslationList({required this.translationslist});

  factory SurahTranslationList.fromJson(Map<String, dynamic> map) {
    Iterable translations = map['result'];
    List<SurahTranslation> list =
        translations.map((e) => SurahTranslation.fromJson(e)).toList();
    print(list.length);
    return SurahTranslationList(translationslist: list);
  }
}

class SurahTranslation {
   String? sura;
   String? aya;
   String? arabic_text;
   String? translation;

  SurahTranslation({
     this.sura,
     this.aya,
     this.arabic_text,
     this.translation,
  });

  factory SurahTranslation.fromJson(Map<String, dynamic> json) {
    return SurahTranslation(
      sura: json['sura'],
      aya: json['aya'],
      arabic_text: json['arabic_text'],
      translation: json['translation'],
    );
  }
}
