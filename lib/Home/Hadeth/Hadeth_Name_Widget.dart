import 'package:flutter/material.dart';
import 'package:islami_02/Home/Hadeth/HadethTab.dart';
import 'package:islami_02/Home/Hadeth/Hadeth_Details_Screen.dart';

class Hadeth_Name_Widget extends StatelessWidget {
  HadethItem item;

  Hadeth_Name_Widget(this.item);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Hadeth_Details_Screen.routeName,
          arguments: item,
        );
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Text(
          item.title,
          style: TextStyle(
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
