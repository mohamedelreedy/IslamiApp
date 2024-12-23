import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamiapp/app_colors.dart';
import 'package:islamiapp/home/tabs/quran/sura_details_screen.dart';
import 'package:islamiapp/home/tabs/quran/sura_list_item.dart';
import 'package:islamiapp/home/tabs/quran/sura_list_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranTab extends StatefulWidget {
  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  void addSuraList() {
    for (int i = 0; i < 114; i++) {
      SuraListItem.suraList.add(SuraListItem(
          suraEnName: SuraListItem.englishQuranSuras[i],
          suraArName: SuraListItem.arabicQuranSuras[i],
          numofVerses: SuraListItem.numOfVerses[i],
          fileName: '${i + 1}.txt'));
    }
  }
Map<String , String > lastSura = {};
  @override
  void initState() {
    super.initState();
    addSuraList();
    loadLastSura();
  }

  List<SuraListItem> filterList = SuraListItem.suraList;
  String searchText = '';

  List<SuraListItem> searchResultList = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/images/Logo.png'),
          TextField(
            cursorColor: AppColors.whiteColor,
            style: TextStyle(
              color: AppColors.whiteColor,
            ),
            decoration: InputDecoration(
              hintText: 'Sura Name ',
              hintStyle: Theme.of(context).textTheme.titleLarge,
              prefixIcon: ImageIcon(
                AssetImage('assets/images/icon_search.png'),
                color: AppColors.primaryColor,
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                    width: 2,
                  )),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            onChanged: (text) {
              searchText = text;
              searchResultList = SuraListItem.suraList.where((sura) {
                return sura.suraArName.contains(searchText) ||
                    sura.suraEnName
                        .toLowerCase()
                        .contains(searchText.toLowerCase());
              }).toList();
              setState(() {});
            },
          ),
          SizedBox(
            height: 20,
          ),
          searchText.isEmpty?
          builtMostRecently():
          Text(
            'Suras List ',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              separatorBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 55),
                  child: Divider(
                    color: AppColors.whiteColor,
                    thickness: 2,
                  ),
                );
              },
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    saveLastSura(
                        suraEnName: filterList[index].suraEnName,
                        suraArName: filterList[index].suraArName,
                        numOfVerses: filterList[index].numofVerses);
                    Navigator.of(context).pushNamed(SuraDetailsScreen.routeName,
                        arguments: searchResultList.isNotEmpty
                            ? searchResultList[index]
                            : filterList[index]);
                  },
                  child: SuraListWidget(
                    suraListItem: searchResultList.isNotEmpty
                        ? searchResultList[index]
                        : filterList[index],
                    index: index,
                  ),
                );
              },
              itemCount: searchResultList.isNotEmpty
                  ? searchResultList.length
                  : filterList.length,
            ),
          )
        ],
      ),
    );
  }

  Widget builtMostRecently() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          'Most Recently',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.primaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                  lastSura['suraEnName']?? '',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                   lastSura ['suraArName'] ?? '',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    '${lastSura['numOfVerses' ] ?? ''} verses',
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                ],
              ),
              Image.asset("assets/images/sura_recently.png"),
            ],
          ),
        )
      ],
    );
  }
  ///saveData => writeData
 Future<void> saveLastSura({required String suraEnName ,
    required String suraArName ,
    required String numOfVerses })async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('suraEnName', suraEnName);
    await prefs.setString('suraArName', suraArName);
    await prefs.setString('numOfVerses', numOfVerses);
    await loadLastSura();
  }
 Future<Map<String,String>> getLastSura()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String suraEnName = prefs.getString('suraEnName')?? '';
    String suraArName = prefs.getString('suraArName')?? '';
    String numOfVerses = prefs.getString('numOfVerses')?? '';
    return {
      'suraEnName' : suraEnName,
      'suraArName' : suraArName,
      'numOfVerses' : numOfVerses
    };
  }
  loadLastSura()async{
    lastSura = await getLastSura();
    setState(() {

    });
  }
}

