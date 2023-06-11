import 'dart:convert';

import 'package:http/http.dart ' as http;
import 'package:news/api/model/NewsListResponse.dart';

import 'model/SourceResponse.dart';

class ApiManager {
  static const String apiKey = '49d06ed4a0c14630a5521661ecfc33a9';
  static const String baseUri = 'newsapi.org';

  static Future<SourceResponse> getNewsSources() async {
    //https://newsapi.org/v2/top-headlines/sources?apiKey=49d06ed4a0c14630a5521661ecfc33a9
    var uri =
        Uri.https(baseUri, 'v2/top-headlines/sources', {'apikey': apiKey});

    var response = await http.get(uri);
    var jsonString = response.body;
    var sourcesResponse = SourceResponse.fromJson(jsonDecode(jsonString));

    return sourcesResponse;
  }

  static Future<NewsListResponse> getNewsList(String sourceId) async {
    //https://newsapi.org/v2/top-headlines?country=us&apiKey=49d06ed4a0c14630a5521661ecfc33a9
    var uri = Uri.https(baseUri, 'v2/top-headlines', {
      'apikey': apiKey,
      'sources': sourceId,
    });
    var response = await http.get(uri);
    var jsonString = response.body;
    var newsList = NewsListResponse.fromJson(jsonDecode(jsonString));

    return newsList;
  }
// static Future<NewsAndSourcesList> getNewsAndSourcesList ()async{
//
//  var sourcesResponse =await getNewsSources();
//  var newsListResponse = await getNewsList();
//  return NewsAndSourcesList(sourcesResponse, newsListResponse);
// }

}

class NewsAndSourcesList {
  SourceResponse? sourceResponse;
  NewsListResponse? newsListResponse;

  NewsAndSourcesList(this.sourceResponse, this.newsListResponse);
}
