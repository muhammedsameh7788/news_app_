import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/api/model/Source.dart';

class NewsFragmentViewModel extends Cubit<NewsFragmentStateClass> {
  NewsFragmentViewModel() : super(SuccessState());

  void loadNewSource() async {
    try {
      var response = await ApiManager.getNewsSources();
      if (response.message == 'error') {
        emit(ErrorState(errorMessage: response.message));
        return;
      }
      if (response.message == 'ok') {
        emit(SuccessState(source: response.sources));
        return;
      }
    } on TimeoutException catch (e) {
      emit(ErrorState(errorMessage: "please check your internet"));
    } catch (e) {
      emit(ErrorState(errorMessage: " try again later"));
    }
  }
}

abstract class NewsFragmentStateClass {}

class LoadingState extends NewsFragmentStateClass {
  String? loadingMassage;

  LoadingState({this.loadingMassage});
}

class ErrorState extends NewsFragmentStateClass {
  String? errorMessage;

  ErrorState({this.errorMessage});
}

class SuccessState extends NewsFragmentStateClass {
  List<Source>? source;

  SuccessState({this.source});
}
