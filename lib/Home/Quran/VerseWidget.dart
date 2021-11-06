import 'package:flutter/material.dart';
import 'package:islami_02/Providers/AppConfigProvider.dart';
import 'package:islami_02/main.dart';
import 'package:provider/provider.dart';

class VerseWidget extends StatelessWidget {
  String text;
  int index;

  VerseWidget(this.text, this.index);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Text(
        text + '      {${index + 1}}',
        textAlign: TextAlign.center,
        style: TextStyle(
          color:
              provider.isDark() ? MyThemeData.accentPrimaryColor : Colors.black,
          fontSize: 20,
        ),
        textDirection: TextDirection.rtl,
      ),
    );
  }
}

