import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_02/Home/Hadeth/Hadeth_Name_Widget.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethItem> All_Hadeth_Items = [];

  @override
  Widget build(BuildContext context) {
    ReadHadethFile();

    return Column(
      children: [
        Expanded(child: Image.asset('assets/images/hadeth_top_logo.png')),
        Expanded(
          flex: 3,
          child: All_Hadeth_Items.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return Hadeth_Name_Widget(All_Hadeth_Items[index]);
                  },
                  itemCount: All_Hadeth_Items.length,
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 1,
                      color: Theme.of(context).primaryColor,
                      margin: EdgeInsets.symmetric(horizontal: 24),
                    );
                  },
                ),
        ),
      ],
    );
  }

  void ReadHadethFile() async {
    List<HadethItem> all_hadeths_data = [];

    String FileContent =
        await rootBundle.loadString('assets/files/hadeths_files.txt');
    //print (FileContent);
    List<String> All_Hadeths = FileContent.split('#\r\n');
    for (int i = 0; i < All_Hadeths.length; i++) {
      List<String> singleHadethContent = All_Hadeths[i].split('\n');
      String title = singleHadethContent[0];

      String content = '';
      for (int j = 1; j < singleHadethContent.length; j++) {
        content += singleHadethContent[j] + ' ';
      }
      HadethItem item = HadethItem(
          title, content); // title refered to the Item in the class below
      all_hadeths_data
          .add(item); // each time adding every title and content to new list.
    }
    All_Hadeth_Items =
        all_hadeths_data; // fill the empty list with the list that has to be filled in the Future function.
    setState(() {});
  }
}

class HadethItem {
  String title;
  String content;

  HadethItem(this.title, this.content);
}
