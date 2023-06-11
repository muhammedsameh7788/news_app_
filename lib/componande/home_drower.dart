import 'package:flutter/material.dart';
import 'package:news/style/theme/mytheme.dart';

class HomeDrower extends StatelessWidget {
  Function categoriesCallback;
  Function settingCallback;

  HomeDrower({required this.categoriesCallback, required this.settingCallback});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(top: 70, bottom: 50),
            color: MyTheme.primaryColor,
            child: const Text(
              'News App',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              categoriesCallback(true);
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Icon(
                  Icons.list,
                  color: Colors.black,
                  size: 32,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'cateories',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 26),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              settingCallback(true);
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                  color: Colors.black,
                  size: 32,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'settings',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 26),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
