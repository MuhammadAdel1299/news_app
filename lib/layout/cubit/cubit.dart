import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/modules/business_screen.dart';
import 'package:news_app/modules/science_screen.dart';
import 'package:news_app/modules/sports_screen.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialStates());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business_center),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
  ];
  List <Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void changeBottomIndex (int index) {
    currentIndex = index;
    emit(NewsBottomNavStates());
  }

  List <dynamic> business = [];

  void getBusiness (){
    emit(NewsGetBusinessLoadingStates());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '8dea888a9ffe49a3a1a59392e53233a3',
      },
    ).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);

      emit(NewsGetBusinessSuccessStates());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErrorStates(error.toString()));
    });
  }

  List <dynamic> sports = [];

  void getSports (){
    emit(NewsGetSportsLoadingStates());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '8dea888a9ffe49a3a1a59392e53233a3',
      },
    ).then((value) {
      sports = value.data['articles'];
      print(sports[0]['title']);

      emit(NewsGetSportsSuccessStates());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSportsErrorStates(error.toString()));
    });
  }

  List <dynamic> science = [];

  void getScience (){
    emit(NewsGetScienceLoadingStates());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '8dea888a9ffe49a3a1a59392e53233a3',
      },
    ).then((value) {
      science = value.data['articles'];
      print(science[0]['title']);

      emit(NewsGetScienceSuccessStates());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetScienceErrorStates(error.toString()));
    });
  }

  List <dynamic> search = [];

  void getSearch (String value){

    emit(NewsGetSearchLoadingStates());

    search = [];

    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$value',
        'apiKey': '8dea888a9ffe49a3a1a59392e53233a3',
      },
    ).then((value) {
      search = value.data['articles'];
      print(search[0]['title']);

      emit(NewsGetSearchSuccessStates());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchErrorStates(error.toString()));
    });
  }
}
