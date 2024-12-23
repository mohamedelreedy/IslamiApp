import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamiapp/app_colors.dart';

class RadioTab extends StatefulWidget {
  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int selectedIndex = 0; // To track which tab is selected

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/images/Logo.png'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.transparentColor,
                borderRadius: BorderRadius.circular(12),

              ),
              child: Row(
                children: [
                  // Radio Tab
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: selectedIndex == 0
                              ? AppColors.primaryColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Radio',
                          style: TextStyle(
                            color: selectedIndex == 0
                                ? AppColors.blackColor
                                : AppColors.whiteColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  // Reciters Tab
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: selectedIndex == 1
                              ? AppColors.primaryColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Reciters',
                          style: TextStyle(
                            color: selectedIndex == 1
                                ? AppColors.blackColor
                                : AppColors.whiteColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            ),
          ),
          buildRadio(),
          buildRadio2(),
          buildRadio3(),
        ],
      ),
    );
  }
  Widget buildRadio() {
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [


        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Container(
            height: 150,
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.primaryColor,
              image: DecorationImage(
                image: AssetImage('assets/images/radio.png'),
              fit: BoxFit.cover)

            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Radio Ibrahim Al-Akdar',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),

                   Padding(
                     padding: const EdgeInsets.only(left: 90),
                     child: Row(
                       children: [
                        Image.asset('assets/images/stop.png'),
                         SizedBox(width: 12),
                         Image.asset('assets/images/pause.png'),
                       ],
                     ),
                   )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
  Widget buildRadio2() {
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [


        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Container(
            height: 150,
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.primaryColor,

                image: DecorationImage(
                    image: AssetImage('assets/images/radio.png'),
                    fit: BoxFit.cover)

            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Radio Al-Qaria Yassen',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 90),
                      child: Row(
                        children: [
                          Image.asset('assets/images/Pause2.png'),
                          SizedBox(width: 12),
                          Image.asset('assets/images/silent.png'),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
  Widget buildRadio3() {
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Container(
            height: 150,
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.primaryColor,
                image: DecorationImage(
                    image: AssetImage('assets/images/radio.png'),
                    fit: BoxFit.cover)

            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Radio Ahmed Al-trabulsi',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 90),
                      child: Row(
                        children: [
                          Image.asset('assets/images/stop.png'),
                          SizedBox(width: 12),
                          Image.asset('assets/images/pause.png'),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}