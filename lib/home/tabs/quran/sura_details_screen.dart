import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamiapp/app_colors.dart';
import 'package:islamiapp/home/tabs/quran/item_sura_content.dart';
import 'package:islamiapp/home/tabs/quran/sura_list_item.dart';


class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura_details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraListItem;
    if (verses.isEmpty){
      loadFile(args.fileName);
    }
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 30,
          title: Text(
            args.suraEnName,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.primaryColor),
          ),
        ),
        body: Stack(
          children: [
            Image.asset('assets/images/Details_bg.png',width: double.infinity,
            height: double.infinity, fit: BoxFit.fill,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 75,
                ),
                Text(args.suraArName,textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 24,color: AppColors.primaryColor
                  ),),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(left: 40.0, right: 40.0 , top: 20 , bottom: 80),
                    child:
                        verses.isEmpty?
                        Center(child: CircularProgressIndicator()) :
                    ListView.builder(itemBuilder: (context,index){
                      return ItemSuraContent(content: verses[index] , index: index,);

                    },
                      itemCount: verses.length,

                    ),
                  ),
                )

              ],
            ),
          ],
        ),
    );
  }

  void loadFile(String  fileName)async{
   String content = await rootBundle.loadString('assets/files/$fileName');
   List<String> lines = content.split('\n');
   verses = lines ;
   setState(() {
   });
  }
}

class SuraDetailsArgs {
  String suraArName;

  String suraEnName;

  int index;

  SuraDetailsArgs(
      {required this.suraArName,
      required this.index,
      required this.suraEnName});
}
