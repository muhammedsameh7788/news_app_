import 'package:flutter/material.dart';
import 'package:news/componande/home_drower.dart';
import 'package:news/model/categoy.dart';
import 'package:news/screens/categotries_screen/categories_screen.dart';
import 'package:news/screens/home_news_fragment/home_news_fragment.dart';
import 'package:news/screens/setting/setting.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? selectedCategory;
  bool selectedSitting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrower(
          categoriesCallback: categoriesClick, settingCallback: settingClick),
      appBar: AppBar(
        title: Text(selectedCategory == null
            ? 'News App'
            : selectedCategory!.typeOfNews),
      ),
      // body: SettingScreen(),
      body: selectedSitting
          ? SettingScreen()
          : selectedCategory == null
              ? CategoriesScreen(selectCategory)
              : HomeNewsFragment(),
    );
  }

  selectCategory(CategoryModel category) {
    selectedCategory = category;
    setState(() {});
  }

  bool categoriesClicked = false;
  bool settingClicked = true;

  categoriesClick(bool isClick) {
    if (isClick == true) {
      selectedCategory = null;
      settingClicked = false;
      selectedSitting = false;

      setState(() {});
    }
  }

  settingClick(settingClicked) {
    if (settingClicked == true) {
      selectedSitting = true;
    } else {
      selectedSitting = false;
    }

    setState(() {});
  }
}
