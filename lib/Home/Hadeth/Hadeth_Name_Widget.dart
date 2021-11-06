import 'package:flutter/material.dart';
import 'package:islami_02/Home/Hadeth/HadethTab.dart';
import 'package:islami_02/Home/Hadeth/Hadeth_Details_Screen.dart';
import 'package:islami_02/Providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';

class Hadeth_Name_Widget extends StatelessWidget {
  HadethItem item;

  Hadeth_Name_Widget(this.item);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

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
            color: provider.isDark() ? Colors.white : Colors.black,
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
