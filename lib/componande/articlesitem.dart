import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/api/model/Articles.dart';

class ArticleWidget extends StatelessWidget {
  Articles? news;

  ArticleWidget(this.news);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: CachedNetworkImage(
              height: 250,
              width: double.infinity,
              fit: BoxFit.fill,
              imageUrl: news?.urlToImage ?? "",
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            news?.source?.name ?? "",
            style: TextStyle(fontSize: 10),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            news?.title ?? "",
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            news?.publishedAt ?? "",
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
