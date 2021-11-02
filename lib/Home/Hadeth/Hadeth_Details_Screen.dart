import 'package:flutter/material.dart';
import 'package:islami_02/Home/Hadeth/HadethTab.dart';

class Hadeth_Details_Screen extends StatelessWidget {
  static const String routeName = 'Hadeth_Details_Screen';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as HadethItem;

    return Stack(
      children: [
        Image(
            fit: BoxFit.fill,
            width: double.infinity,
            image: AssetImage('assets/images/main_background.png')),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(args.title),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(vertical: 48, horizontal: 5),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Text(
                args.content,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.end,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
