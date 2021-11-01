import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_02/Home/Quran/Sura_Details_Screen.dart';

class Sura_Name_Widget extends StatelessWidget {
  String SuraName;
  int index;

  Sura_Name_Widget(this.index, this.SuraName);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Sura_Details_Screen.routeName,
          arguments: Sura_Details_Args(index, SuraName),
        );
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            SuraName,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
