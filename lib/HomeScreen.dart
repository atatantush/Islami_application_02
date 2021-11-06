import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_02/Home/Hadeth/HadethTab.dart';
import 'package:islami_02/Home/Quran/QuranTab.dart';
import 'package:islami_02/Home/Radio/RadioTab.dart';
import 'package:islami_02/Home/Tasbeh/TasbehTab.dart';
import 'package:islami_02/Providers/AppConfigProvider.dart';
import 'package:islami_02/settings/SettingsTab.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Stack(
      children: [
        Image(
          fit: BoxFit.fill,
          width: double.infinity,
          image: AssetImage(provider.isDark()
              ? 'assets/images/main_background_dark.png'
              : 'assets/images/main_background.png'),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.app_title),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Theme.of(context).primaryColor,
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
                  label: AppLocalizations.of(context)!.quran,
                ),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_hadeth.png'),
                      size: 35,
                    ),
                    label: AppLocalizations.of(context)!.hadeth),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_sebha.png'),
                      size: 35,
                    ),
                    label: AppLocalizations.of(context)!.tasbeh),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/icon_radio.png'),
                      size: 35,
                    ),
                    label: AppLocalizations.of(context)!.radio),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.settings,
                ),
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
    SettingsTab(),
  ];
}
