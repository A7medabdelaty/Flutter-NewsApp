import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/modules/news_app_secreens/science_screen.dart';
import 'package:newsapp/modules/news_app_secreens/sports_screen.dart';
import 'package:newsapp/modules/news_app_secreens/technology_screen.dart';
import 'package:newsapp/shared/cubit/states.dart';
import 'package:newsapp/shared/network/local/cache_helper.dart';

import '../../modules/news_app_secreens/business_screen.dart';
import '../network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(InitialNewsState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeIndex(index) {
    currentIndex = index;
    emit(AppBottomNavBarState());
  }

  List<String> titles = [
    'Business',
    'Sports',
    'Science',
    'Technology',
  ];

  List<Widget> screens = [
    Business(),
    Sports(),
    Science(),
    Technology(),
  ];

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  List<dynamic> technology = [];
  List<dynamic> search = [];

  void getBusiness() {
    emit(NewsBusinessLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': 'dec8effbbc9f44fc95ea74dffb1ce639',
    }).then((value) {
      business = value!.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }).catchError((err) {
      print(err.toString());
      emit(NewsGetBusinessErrorState());
    });
  }

  void getSports() {
    emit(NewsSportsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': 'dec8effbbc9f44fc95ea74dffb1ce639',
    }).then((value) {
      sports = value!.data['articles'];
      emit(NewsGetSportsSuccessState());
    }).catchError((err) {
      print(err.toString());
      emit(NewsGetSportsErrorState());
    });
  }

  void getScience() {
    emit(NewsScienceLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': 'dec8effbbc9f44fc95ea74dffb1ce639',
    }).then((value) {
      science = value!.data['articles'];
      emit(NewsGetScienceSuccessState());
    }).catchError((err) {
      print(err.toString());
      emit(NewsGetScienceErrorState());
    });
  }

  void getTechnology() {
    emit(NewsTechnologyLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'technology',
      'apiKey': 'dec8effbbc9f44fc95ea74dffb1ce639',
    }).then((value) {
      technology = value!.data['articles'];
      emit(NewsGetTechnologySuccessState());
    }).catchError((error) {
      emit(NewsGetTechnologyErrorState());
    });
  }

  void getSearch(String value) {
    DioHelper.getData(url: 'v2/everything', query: {
      'q': value,
      'apiKey': 'dec8effbbc9f44fc95ea74dffb1ce639',
    }).then((value) {
      search = value!.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      emit(NewsGetSearchErrorState());
    });
  }

  bool? isDarkMode = false;

  void changeMode({bool? dark}) {
    if (dark != null) {
      isDarkMode = dark;
    } else {
      isDarkMode = !isDarkMode!;
    }
    CacheHelper.setBool(key: 'isDark', value: isDarkMode).then((value) {
      emit(ChangeAppMode());
    });
  }
}
