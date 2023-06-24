import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/screens/articles/articles_screen.dart';

class HomeNewsFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getNewsSources(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } //0132714265
          if (snapshot.hasError) {
            return Center(
              child: Column(
                children: [
                  Text(snapshot.error.toString()),
                  ElevatedButton(
                      onPressed: () {}, child: const Text('try again'))
                ],
              ),
            );
          }

          var response = snapshot.data;
          if (response == 'error') {
            Center(
              child: Column(
                children: [
                  Text(response?.message ?? ""),
                  ElevatedButton(
                      onPressed: () {}, child: const Text('try again'))
                ],
              ),
            );
          }

          return ArticlesScreen(
            sources: response?.sources,
          );
        });
  }
}
