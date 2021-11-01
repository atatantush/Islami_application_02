import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_02/Home/Hadeth/HadethTab.dart';
import 'package:islami_02/Home/Quran/QuranTab.dart';
import 'package:islami_02/Home/Radio/RadioTab.dart';
import 'package:islami_02/Home/Tasbeh/TasbehTab.dart';
import 'package:islami_02/main.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
            fit: BoxFit.fill,
            width: double.infinity,
            image: AssetImage('assets/images/main_background.png')),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('Islami'),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: MyThemeData.primaryColor,
            ),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                currentIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/icon_quran.png'),
                    size: 35,
                  ),
                  label: 'Quran',
                ),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_hadeth.png'),
                      size: 35,
                    ),
                    label: 'Hadeth'),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_sebha.png'),
                      size: 35,
                    ),
                    label: 'Sebha'),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_radio.png'),
                      size: 35,
                    ),
                    label: 'Radio'),
              ],
            ),
          ),
          body: Container(
            child: Views[currentIndex],
          ),
        ),
      ],
    );
  }

  List<Widget> Views = [
    QuranTab(),
    HadethTab(),
    TasbehTab(),
    RadioTab(),
  ];
}
