import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamiapp/app_colors.dart';
import 'package:islamiapp/home/tabs/quran/sura_list_item.dart';
class SuraListWidget extends StatelessWidget {
SuraListItem suraListItem;
int index;
SuraListWidget({required this.suraListItem , required this.index});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/sura_vector.png'),
            Text('${index+1}', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(suraListItem.suraEnName,
                      style: Theme.of(context).textTheme.bodyMedium),
                  Text(
                    '${suraListItem.numofVerses} verses',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
              Text(
                suraListItem.suraArName,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
