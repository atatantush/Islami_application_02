import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_02/Providers/AppConfigProvider.dart';
import 'package:islami_02/settings/LanguageBottomSheet.dart';
import 'package:provider/provider.dart';

import 'ThemeBottomSheet.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 35),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: TextStyle(
              fontSize: 18,
              color: provider.isDark() ? Colors.white : Colors.black,
            ),
          ),
          InkWell(
            onTap: () {
              ShowLanguageBottoSheet();
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.appLanguage == 'en' ? 'English' : 'العربية'),
                  Icon(Icons.arrow_drop_down_sharp),
                ],
              ),
            ),
          ),
          Text(
            AppLocalizations.of(context)!.theme,
            style: TextStyle(
              fontSize: 18,
              color: provider.isDark() ? Colors.white : Colors.black,
            ),
          ),
          InkWell(
            onTap: () {
              ShowThemeBottomSheet();
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.appTheme == ThemeMode.light
                      ? AppLocalizations.of(context)!.light
                      : AppLocalizations.of(context)!.dark),
                  Icon(Icons.arrow_drop_down_sharp),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void ShowLanguageBottoSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return LangaugeBottomSheet();
      },
    );
  }

  void ShowThemeBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ThemeBottomSheet();
        });
  }
}
