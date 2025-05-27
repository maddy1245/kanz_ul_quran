import 'package:flutter/material.dart';
import 'package:kanzul_quran/models/qari.dart';

class QariCustomTile extends StatefulWidget {
  final Qari qari;
  final VoidCallback ontap;
  const QariCustomTile({super.key, required this.qari, required this.ontap});

  @override
  State<QariCustomTile> createState() => _QariCustomTileState();
}

class _QariCustomTileState extends State<QariCustomTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Padding(
        padding: EdgeInsets.all(4),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                spreadRadius: 0,
                color: Colors.black12,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            children: [
              Text(
                widget.qari.name!,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
