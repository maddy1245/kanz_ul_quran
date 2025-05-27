import 'package:flutter/material.dart';
import 'package:kanzul_quran/models/juz.dart';

class JuzCustomTile extends StatelessWidget {
  final List<JuzAyahs> list;
  final int index;

  const JuzCustomTile({super.key, required this.list, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(list[index].ayahsNumber.toString()),
          Text(list[index].ayahsText,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),textAlign: TextAlign.end,),
          Text(list[index].surahName,textAlign: TextAlign.end),
        ],
      ),
    );
  }
}
