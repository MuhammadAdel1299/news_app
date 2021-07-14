abstract class NewsStates {}

class NewsInitialStates extends NewsStates{}

class NewsBottomNavStates extends NewsStates{}

class NewsGetBusinessSuccessStates extends NewsStates{}

class NewsGetBusinessLoadingStates extends NewsStates{}

class NewsGetBusinessErrorStates extends NewsStates{
  final String error ;
  NewsGetBusinessErrorStates(this.error);
}

class NewsGetSportsSuccessStates extends NewsStates{}

class NewsGetSportsLoadingStates extends NewsStates{}

class NewsGetSportsErrorStates extends NewsStates{
  final String error ;
  NewsGetSportsErrorStates(this.error);
}

class NewsGetScienceSuccessStates extends NewsStates{}

class NewsGetScienceLoadingStates extends NewsStates{}

class NewsGetScienceErrorStates extends NewsStates{
  final String error ;
  NewsGetScienceErrorStates(this.error);
}

class NewsGetSearchSuccessStates extends NewsStates{}

class NewsGetSearchLoadingStates extends NewsStates{}

class NewsGetSearchErrorStates extends NewsStates{
  final String error ;
  NewsGetSearchErrorStates(this.error);
}