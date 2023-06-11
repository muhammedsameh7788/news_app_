import 'package:flutter/material.dart';
import 'package:news/api/model/Source.dart';
import 'package:news/componande/tap_bar_widget.dart';
import 'package:news/screens/news_countainer/news_countainer.dart';

class ArticlesScreen extends StatefulWidget {
  List<Source>? sources;

  ArticlesScreen({required this.sources});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources?.length ?? 0,
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/pattern.jpg'),
          fit: BoxFit.fill,
        )),
        child: Column(
          children: [
            TabBar(
                indicatorColor: Colors.transparent,
                isScrollable: true,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                tabs: widget.sources
                        ?.map((source) => TabWidget(
                              isSelected: selectedIndex ==
                                  widget.sources?.indexOf(source),
                              sourse: source,
                            ))
                        .toList() ??
                    []),
            const SizedBox(
              height: 20,
            ),
            NewsContainer(source: widget.sources?[selectedIndex])
          ],
        ),
      ),
    );
  }
}
