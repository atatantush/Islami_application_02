import 'package:flutter/material.dart';
import 'package:islami_02/Providers/AppConfigProvider.dart';
import 'package:islami_02/main.dart';
import 'package:provider/provider.dart';

class LangaugeBottomSheet extends StatefulWidget {
  @override
  State<LangaugeBottomSheet> createState() => _LangaugeBottomSheetState();
}

class _LangaugeBottomSheetState extends State<LangaugeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Container(
      color: provider.isDark()
          ? MyThemeData.primaryColorDark
          : MyThemeData.primaryColor,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.ChangeLanguage('en');
            },
            child: provider.appLanguage == 'en'
                ? getSelectedItemWidget('English')
                : getUnselectedItemWidget('English'),
          ),
          InkWell(
            onTap: () {
              provider.ChangeLanguage('ar');
            },
            child: provider.appLanguage == 'ar'
                ? getSelectedItemWidget('العربية')
                : getUnselectedItemWidget('العربية'), // : means else.
          ),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: provider.isDark()
                  ? MyThemeData.accentPrimaryColor
                  : Colors.brown,
            ),
          ),
          Icon(Icons.check,
              color: provider.isDark()
                  ? MyThemeData.accentPrimaryColor
                  : Colors.brown),
        ],
      ),
    );
  }

  Widget getUnselectedItemWidget(String text) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              color: provider.isDark() ? Colors.white : Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
