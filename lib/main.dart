import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_02/Home/Hadeth/Hadeth_Details_Screen.dart';
import 'package:islami_02/Home/Quran/Sura_Details_Screen.dart';
import 'package:islami_02/HomeScreen.dart';

void main() {
  runApp(MainApplication());
}

class MyThemeData {
  static const Color primaryColor = Color.fromRGBO(183, 147, 95, 1.0);
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Color.fromRGBO(183, 147, 95, 1.0),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    primaryColor: Color.fromRGBO(20, 26, 46, 1.0),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.yellow,
      unselectedItemColor: Colors.white,
    ),
  );
}

class MainApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islami',
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      routes: {
        HomeScreen.routeName: (buildContext) => HomeScreen(),
        Sura_Details_Screen.routeName: (buildContext) => Sura_Details_Screen(),
        Hadeth_Details_Screen.routeName: (buildContext) =>
            Hadeth_Details_Screen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
