import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/categoy.dart';

class CategoryWidget extends StatefulWidget {
  CategoryModel category;
  int index;

  CategoryWidget(
    this.category,
    this.index,
  );

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: widget.category.containerColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomRight:
                  widget.index.isOdd ? Radius.circular(30) : Radius.zero,
              bottomLeft:
                  widget.index.isEven ? Radius.circular(30) : Radius.zero,
            )),
        child: Column(
          children: [
            Image.asset(
              widget.category.imagePath,
              width: 100,
              height: 100,
            ),
            SizedBox(
              height: 10,
            ),
            Text(widget.category.typeOfNews),
          ],
        ));
  }
}
