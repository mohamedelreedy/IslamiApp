import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamiapp/app_colors.dart';

class ItemSuraContent extends StatefulWidget {
  String content ;
  int index ;
  ItemSuraContent({required this.content , required this.index});

  @override
  State<ItemSuraContent> createState() => _ItemSuraContentState();
}

class _ItemSuraContentState extends State<ItemSuraContent> {
  bool isSelected = false ;
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected; // Toggle selection state
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16,horizontal: 5),
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppColors.primaryColor,
            width: 2
          ),
          color: isSelected ? AppColors.primaryColor : Colors.transparent,
        ),
        margin: EdgeInsets.all(12),
        child: Text('${widget.content}[ ${widget.index + 1} ]' ,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style:  Theme.of(context).textTheme.headlineLarge),
      ),
    );
  }
}
