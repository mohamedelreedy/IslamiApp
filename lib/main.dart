import 'package:flutter/material.dart';
import 'package:islamiapp/home/homescreen.dart';
import 'package:islamiapp/my_theme_data.dart';

import 'home/tabs/hadeth/hadeth_details_screen.dart';
import 'home/tabs/quran/sura_details_screen.dart';



void main(){

  runApp(MyApp(
  )
  );

}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.dark,
      routes:{
        HomeScreen.routeName : (context)=>HomeScreen(),
        SuraDetailsScreen.routeName : (context)=>SuraDetailsScreen(),
        HadithDetailsScreen.routeName : (context)=> HadithDetailsScreen(),

      },
    );
  }

}