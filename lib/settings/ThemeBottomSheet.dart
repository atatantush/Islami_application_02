import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_02/Providers/AppConfigProvider.dart';
import 'package:islami_02/main.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _LangaugeBottomSheetState();
}

class _LangaugeBottomSheetState extends State<ThemeBottomSheet> {
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
              provider.ChangeTheme(ThemeMode.light);
            },
            child: provider.isDark()
                ? getUnselectedItemWidget(AppLocalizations.of(context)!.light)
                : getSelectedItemWidget(AppLocalizations.of(context)!.light),
          ),
          InkWell(
            onTap: () {
              provider.ChangeTheme(ThemeMode.dark);
            },
            child: provider.isDark()
                ? getSelectedItemWidget(AppLocalizations.of(context)!.dark)
                : getUnselectedItemWidget(
                    AppLocalizations.of(context)!.dark), // : means else.
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
