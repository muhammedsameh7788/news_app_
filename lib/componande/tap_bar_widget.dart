import 'package:flutter/material.dart';
import 'package:news/api/model/Source.dart';
import 'package:news/style/theme/mytheme.dart';

class TabWidget extends StatelessWidget {
  bool isSelected = false;

  Source sourse;

  TabWidget({this.isSelected = false, required this.sourse});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: isSelected ? MyTheme.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: MyTheme.primaryColor, width: 3)),
      child: Text(
        sourse?.name ?? '',
        style: TextStyle(
          color: isSelected ? Colors.white : MyTheme.primaryColor,
          fontSize: 19,
        ),
      ),
    );
  }
}
