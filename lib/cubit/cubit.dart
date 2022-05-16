import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/states.dart';
import 'package:newsapp/model/Dio_Helper.dart';
import 'package:newsapp/modules/business.dart';
import 'package:newsapp/modules/science.dart';
import 'package:newsapp/modules/settings.dart';
import 'package:newsapp/modules/sport.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewInitailStates());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List tasks = [];
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  void changeNavbar(int index) {
    currentIndex = index;
    if (index == 1) {
      getSports();
    } else if (index == 2) {
      getScience();
    }
    emit(NewsBottomNavBar());
  }

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> sicence = [];

  void getBussines() {
    if (business.length == 0) {
      emit(NewsGetBusinessLoadingState());
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '71d27b3f3b6b4ac28823e0dd09b510f1'
      }).then((value) {
        business = value.data['articles'];
        print(business[0]['title']);
        emit(NewsGetBusinessSucessState());
      }).catchError((error) {
        NewsGetBusinessErorrState(error);
        print(error.toString());
      });
    } else {
      emit(NewsGetBusinessSucessState());
    }
  }

  void getSports() {
    if (sports.length == 0) {
      emit(NewsGetSportsLoadingState());
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '71d27b3f3b6b4ac28823e0dd09b510f1'
      }).then((value) {
        sports = value.data['articles'];

        emit(NewsGetSportsSucessState());
      }).catchError((error) {
        NewsGetSportsErorrState(error);
        print(error.toString());
      });
    } else {
      emit(NewsGetSportsSucessState());
    }
  }

  void getScience() {
    if (sicence.length == 0) {
      emit(NewsGetScienceLoadingState());
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '71d27b3f3b6b4ac28823e0dd09b510f1'
      }).then((value) {
        sicence = value.data['articles'];
        print(business[0]['title']);
        emit(NewsGetsScienceSucessState());
      }).catchError((error) {
        NewsGetScienceErorrState(error);
        print(error.toString());
      });
    } else {
      emit(NewsGetsScienceSucessState());
    }
  }

  List<dynamic> search = [];

  void getSearch(value) {
    emit(NewsGetSearchLoadingState());
    search = [];
    DioHelper.getData(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': '71d27b3f3b6b4ac28823e0dd09b510f1'
    }).then((value) {
      search = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetsSearchSucessState());
    }).catchError((error) {
      NewsGetSearchErorrState(error);
      print(error.toString());
    });
  }
}
