import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamiapp/home/tabs/hadeth/hadeth_model.dart';

import '../../../app_colors.dart';

class HadithDetailsScreen extends StatelessWidget {
  static const String routeName = 'Hadith_Details';
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethModel;
      return Scaffold(
        appBar: AppBar(
        ),
        body: Stack(
          children: [
            Image.asset('assets/images/Details_bg.png',width: double.infinity,
              height: double.infinity, fit: BoxFit.fill,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 75,
                ),
                Text(args.title,textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 24,color: AppColors.primaryColor
                  ),),
                Expanded(
                  
                  flex: 2,
                  child: Container(

                    child: ListView.builder(itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(args.content[index] ,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 22
                          ),),
                        );
                    
                      },
                        itemCount: args.content.length,
                    
                      ),
                  ),
                  ),
                

              ],
            ),
          ],
        ),
      );
  }
}
