import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_02/Home/Quran/VerseWidget.dart';

class Sura_Details_Screen extends StatefulWidget {
  static const String routeName = 'Sura_Details_Screen';

  @override
  State<Sura_Details_Screen> createState() => _Sura_Details_ScreenState();
}

class _Sura_Details_ScreenState extends State<Sura_Details_Screen> {
  List<String> ayat = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Sura_Details_Args;

    if (ayat.isEmpty) {
      ReadSura(args.index);
    }

    return Stack(
      children: [
        Image(
            fit: BoxFit.fill,
            width: double.infinity,
            image: AssetImage('assets/images/main_background.png')),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(args.SuraName),
          ),
          body: Container(
              margin: EdgeInsets.only(top: 35, bottom: 15, left: 10, right: 10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(48),
              ),
              child: ayat.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        return VerseWidget(ayat[index], index);
                      },
                      itemCount: ayat.length,
                      separatorBuilder: (context, index) {
                        return Container(
                          height: 1,
                          color: Theme.of(context).primaryColor,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                        );
                      },
                    )),
        ),
      ],
    );
  }

  void ReadSura(index) async {
    String FileName = 'assets/files/${index + 1}.txt';
    String FileContent = await rootBundle.loadString(FileName);
    print(FileContent);
    List<String> versus = FileContent.split('\n');
    ayat = versus;
    setState(() {});
  }
}

class Sura_Details_Args {
  String SuraName;
  int index;

  Sura_Details_Args(this.index, this.SuraName);
}
