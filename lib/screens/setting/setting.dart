import 'package:flutter/material.dart';
import 'package:news/style/theme/mytheme.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/pattern.jpg'),
        fit: BoxFit.fill,
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'language',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          //SizedBox(height: 10,),
          Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: MyTheme.primaryColor, width: 2)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'english',
                  style: TextStyle(fontSize: 14),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  size: 30,
                  color: MyTheme.primaryColor,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
