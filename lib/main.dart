import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_02/Home/Hadeth/Hadeth_Details_Screen.dart';
import 'package:islami_02/Home/Quran/Sura_Details_Screen.dart';
import 'package:islami_02/HomeScreen.dart';
import 'package:islami_02/Providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return AppConfigProvider();
      },
      child: MainApplication()));
}

class MyThemeData {
  static const Color primaryColor = Color.fromRGBO(183, 147, 95, 1.0);
  static const Color primaryColorDark = Color.fromRGBO(20, 26, 46, 1.0);
  static const Color accentPrimaryColor = Color.fromRGBO(250, 204, 29, 1.0);

  static final ThemeData lightTheme = ThemeData(
    primaryColor: MyThemeData.primaryColor,
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
    primaryColor: MyThemeData.primaryColorDark,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: MyThemeData.accentPrimaryColor,
      unselectedItemColor: Colors.white,
    ),
  );
}

class MainApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return MaterialApp(
      title: 'Islami',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: provider.appTheme,
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
