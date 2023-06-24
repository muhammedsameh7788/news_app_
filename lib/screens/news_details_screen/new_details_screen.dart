import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/api/model/Articles.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const String routeName = 'news details screen ';

  @override
  Widget build(BuildContext context) {
    var news = ModalRoute.of(context)?.settings.arguments as Articles;

    return Scaffold(
      appBar: AppBar(
        title: Text(news.title ?? ""),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/pattern.jpg'),
          fit: BoxFit.fill,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 15,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: CachedNetworkImage(
                height: 250,
                width: double.infinity,
                fit: BoxFit.fill,
                imageUrl: news.urlToImage ?? "",
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              news.source?.name ?? "",
              style: const TextStyle(fontSize: 10),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              news?.title ?? "",
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              news.publishedAt ?? "",
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Card(
              color: Colors.white,
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Text(
                      news.content ?? "",
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton.icon(
                            onPressed: () {
                              openUrl(news.url);
                            },
                            icon: Icon(
                              Icons.arrow_right,
                              size: 40,
                            ),
                            label: Text("View Full Article"))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void openUrl(String? url) async {
    if (url == null) {
      return;
    }
    var newUrlUri = Uri.parse(url);
    if (await canLaunchUrl(newUrlUri)) {
      launchUrl(newUrlUri);
    }
  }
}
