import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamiapp/app_colors.dart';
import 'package:islamiapp/home/tabs/hadeth/hadeth_model.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'hadeth_details_screen.dart';

class HadethTab extends StatefulWidget{
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethModel> hadethList = [];

  @override
  Widget build(BuildContext context) {
      if(hadethList.isEmpty){
        loadHadethFile();
      }
    return Container(
      child:Column(

        children: [
          Image.asset('assets/images/Logo.png'),
          CarouselSlider.builder(
            options: CarouselOptions(
                height: 605.97,
              viewportFraction: 0.75,
              scrollDirection: Axis.horizontal,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
            ),
            itemCount: hadethList.length,
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed(HadithDetailsScreen.routeName ,
                    arguments: hadethList[itemIndex]);

                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: AppColors.primaryColor,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                          image: AssetImage('assets/images/hadeth_bg_image.png'))
                    ),
                    child: hadethList.isEmpty?
                        Center(child: CircularProgressIndicator(color: AppColors.primaryColor,)):
                    Column(
                      children: [
                        Text(hadethList[itemIndex].title,
                          style: TextStyle(
                            color: AppColors.blackColor,
                          )
                          ),
                        SizedBox(height: 10,),
                        Expanded(child:
                        Text (hadethList[itemIndex].content.join('') ,
                          textAlign: TextAlign.center ,
                          textDirection: TextDirection.rtl,
                          style:
                          TextStyle(color: AppColors.blackColor ,
                              fontSize: 20,fontWeight: FontWeight.w700 ,
                          ),)

                        )
                      ],
                    ),


                  ),
                ),
          ),
        ],
      )

    );
  }

void loadHadethFile() async{
    for(int i = 1 ; i <= 50 ; i++){
     String hadithContent = await rootBundle.loadString('assets/files2/h$i.txt');
     List <String> hadethLines = hadithContent.split('\n');
     String title = hadethLines[0];
     hadethLines.removeAt(0);
     HadethModel hadethModel = HadethModel(title: title, content: hadethLines);
     hadethList.add(hadethModel);
     setState(() {

     });
    }

}
}