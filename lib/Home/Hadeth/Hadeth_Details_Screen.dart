import 'package:flutter/material.dart';
import 'package:islami_02/Home/Hadeth/HadethTab.dart';
import 'package:islami_02/Providers/AppConfigProvider.dart';
import 'package:islami_02/main.dart';
import 'package:provider/provider.dart';

class Hadeth_Details_Screen extends StatelessWidget {
  static const String routeName = 'Hadeth_Details_Screen';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as HadethItem;

    var provider = Provider.of<AppConfigProvider>(context);

    return Stack(
      children: [
        Image(
            fit: BoxFit.fill,
            width: double.infinity,
            image: AssetImage(provider.isDark()
                ? 'assets/images/main_background_dark.png'
                : 'assets/images/main_background.png')),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(args.title),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(vertical: 100, horizontal: 10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: provider.isDark()
                  ? MyThemeData.primaryColorDark
                  : Colors.white,
            ),
            child: SingleChildScrollView(
              child: Text(
                args.content,
                style: TextStyle(
                  fontSize: 18,
                  color: provider.isDark()
                      ? MyThemeData.accentPrimaryColor
                      : Colors.black,
                ),
                textAlign: TextAlign.end,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
