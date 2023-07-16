import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/screens/articles/articles_screen.dart';
import 'package:news/screens/home_news_fragment/news_fragment_view_model.dart';

class HomeNewsFragment extends StatelessWidget {
  var viewModel = NewsFragmentViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.loadNewSource();
    return BlocBuilder<NewsFragmentViewModel, NewsFragmentStateClass>(
      bloc: viewModel,
      builder: (buildContext, state) {
        if (state is LoadingState) {
          return Center(child: CircularProgressIndicator());
          //edeeni f loading
        } else if (state is ErrorState) {
          // talla3o
          return Center(
            child: Column(
              children: [
                Text(state.errorMessage ?? ""),
                ElevatedButton(onPressed: () {}, child: const Text('try again'))
              ],
            ),
          );
        } else if (state is SuccessState) {
          return ArticlesScreen(sources: state.source);
        }
        return Container();
      },
    );
  }
}
