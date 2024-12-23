import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamiapp/app_colors.dart';
import 'package:islamiapp/home/tabs/hadeth/hadethtab.dart';
import 'package:islamiapp/home/tabs/quran/qurantab.dart';
import 'package:islamiapp/home/tabs/radio/radiotab.dart';
import 'package:islamiapp/home/tabs/sebha/sebhatab.dart';
import 'package:islamiapp/home/tabs/time/timetab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home_Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> backGroundImage = [
    'assets/images/quranBackground.png',
    'assets/images/hadeth_bg.png',
    'assets/images/sebha_bg.png',
    'assets/images/radio_bg.png',
    'assets/images/time_bg.png',
  ];
  List<Widget> tabs = [
    QuranTab(),HadethTab(),SebhaTab(),RadioTab(),TimeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
        Image.asset(backGroundImage[selectedIndex]),
    Scaffold(
    //backgroundColor: Colors.transparent,
    bottomNavigationBar: Theme(
    data:
    Theme.of(context).copyWith(canvasColor: AppColors.primaryColor),
    child: BottomNavigationBar(
    //  (another way to change bottom bar color )type: BottomNavigationBarType.fixed,
    currentIndex: selectedIndex,
    onTap: (index){
    selectedIndex = index ;
    setState(() {

    });
    },

    items: [
    BottomNavigationBarItem(
    icon: builtItemInBottomNavigationBar(index: 0, imageName:'ic_quran' ),
    label: 'Quran'),
      BottomNavigationBarItem(
          icon: builtItemInBottomNavigationBar(index: 1, imageName:'ic_hadith' ),
          label: 'Hadith'),
      BottomNavigationBarItem(
          icon: builtItemInBottomNavigationBar(index: 2, imageName:'ic_sebha' ),
          label: 'Sebha'),
      BottomNavigationBarItem(
          icon: builtItemInBottomNavigationBar(index: 3, imageName:'ic_radio' ),
          label: 'Radio'),
      BottomNavigationBarItem(
          icon: builtItemInBottomNavigationBar(index: 4, imageName:'ic_time' ),
          label: 'Time'),
    ],
    ),
    ),
      body: tabs[selectedIndex],
    )
    ],
    );
  }
  Widget builtItemInBottomNavigationBar({required int index , required String imageName }){
    return selectedIndex == index ?
    Container(
      padding: EdgeInsets.symmetric(vertical: 6 , horizontal: 20),

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(66),
          color: Color(0x99202020)
      ),
    child: ImageIcon(AssetImage('assets/images/$imageName.png'))):
        ImageIcon(AssetImage('assets/images/$imageName.png'));



  }
}
