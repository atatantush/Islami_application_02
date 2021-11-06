import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_02/Providers/AppConfigProvider.dart';
import 'package:islami_02/main.dart';
import 'package:provider/provider.dart';

class TasbehTab extends StatefulWidget {
  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int counter = 0;

  List<String> duaa = [
    'استغفر الله',
    ' الله اكبر',
    ' الحمد لله',
    'سبحان الله',
    ' لا اله الا الله',
    'سبحان الله العظيم'
  ];
  int currentIndex = 0;
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              InkWell(
                onTap: () {
                  onPressedCounter();
                },
                child: Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1),
                  child: Transform.rotate(
                    angle: angle,
                    child: Image.asset(provider.isDark()
                        ? 'assets/images/sebha_body_dark.png'
                        : 'assets/images/sebha_body.png'),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height * 0.05),
                child: Image.asset(provider.isDark()
                    ? 'assets/images/sebha_head_dark.png'
                    : 'assets/images/sebha_head.png'),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Text(
              'عدد التسبيحات',
              style: TextStyle(
                  color: provider.isDark() ? Colors.white : Colors.black,
                  fontSize: 25),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: provider.isDark()
                  ? MyThemeData.primaryColorDark
                  : MyThemeData.primaryColor,
            ),
            child: Text(
              '$counter',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: provider.isDark() ? Colors.white : Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: provider.isDark()
                  ? MyThemeData.accentPrimaryColor
                  : MyThemeData.primaryColor,
            ),
            child: Text(
              duaa[currentIndex],
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: provider.isDark() ? Colors.black : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onPressedCounter() {
    setState(() {
      counter++;
      angle = angle + 50;
      if (counter % 33 == 0) {
        if (currentIndex == duaa.length - 1) {
          currentIndex = 0;
        }
        currentIndex++;
      }
    });
  }
}
