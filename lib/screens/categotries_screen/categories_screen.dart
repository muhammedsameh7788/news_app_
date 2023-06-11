import 'package:flutter/material.dart';

import '../../model/categoy.dart';
import '../../ui/home/categories_widget.dart';

class CategoriesScreen extends StatelessWidget {
  Function callback;

  CategoriesScreen(this.callback);

  List<CategoryModel> categories = [
    CategoryModel(
        imagePath: 'assets/images/sports.png',
        typeOfNews: 'sports',
        containerColor: Color(0xffC91C22)),
    CategoryModel(
        imagePath: 'assets/images/Politics.png',
        typeOfNews: 'politics',
        containerColor: Color(0xff003E90)),
    CategoryModel(
        imagePath: 'assets/images/health.png',
        typeOfNews: 'health',
        containerColor: Color(0xffED1E79)),
    CategoryModel(
        imagePath: 'assets/images/bussines.png',
        typeOfNews: 'Business ',
        containerColor: Color(0xffCF7E48)),
    CategoryModel(
        imagePath: 'assets/images/environment.png',
        typeOfNews: 'Environment',
        containerColor: Color(0xff4882CF)),
    CategoryModel(
        imagePath: 'assets/images/science.png',
        typeOfNews: 'science',
        containerColor: Color(0xffF2D352)),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/pattern.jpg'),
        fit: BoxFit.fill,
      )),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              '''Pick your category 
  of interest''',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1 / 1,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          callback(categories[index]);
                        },
                        child: CategoryWidget(categories[index], index));
                  },
                  itemCount: categories.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
