import 'package:flutter/material.dart';

import '../../api/api_manager.dart';
import '../../api/model/Source.dart';
import '../../componande/articlesitem.dart';

class NewsContainer extends StatelessWidget {
  Source? source;

  NewsContainer({required this.source});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getNewsList(source?.id ?? ''),
        builder: (context, snapshot) {
          //print(source.id);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          if (snapshot.data?.status != 'ok') {
            return Text(snapshot.data?.message ?? '');
          }
          var newList = snapshot.data?.articles ?? [];
          return Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => ArticleWidget(newList[index]),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 12,
                    ),
                itemCount: newList.length ?? 0),
          );
        });
  }
}
