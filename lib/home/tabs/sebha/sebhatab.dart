import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget{
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  double rotationAngle = 0.0;
  String counterText = 'سبحان الله';
  void sebhaCounter(){
    setState(() {
      counter++;
      if (counter <= 33) {
        counterText = 'سبحان الله';
      } else if (counter <= 66) {
        counterText = 'الحمد لله';
      } else if (counter <= 99) {
        counterText = 'الله أكبر';
      }
      if (counter== 99 ){
        counter = 0 ;
        counterText = 'سبحان الله';
      }
      rotationAngle += 0.25;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/images/Logo.png'),
            Text('سَبِّحِ اسْمَ رَبِّكَ الأعلى' , style: TextStyle(
              fontSize: 36 , fontWeight: FontWeight.w700
            ),
            textAlign: TextAlign.center),
            SizedBox(height: 60,),
            Align(
              alignment: Alignment.center,
              child: Stack(
                  children: [
                    GestureDetector(
                      onTap : sebhaCounter,
                        child: 
                        AnimatedRotation(
                            turns: rotationAngle, // Apply the rotation angle
                            duration: Duration(milliseconds: 250),
                            child: Image.asset('assets/images/SebhaBody.png'))),
                    Padding(
                      padding: const EdgeInsets.all(140),
                      child: Column(
                        children: [
                          Text(
                            counterText,
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '$counter',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )



                  ]),
            ),

          ],

        ),
    );
  }
}