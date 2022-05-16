abstract class NewsStates {}

class NewInitailStates extends NewsStates {}

class NewsBottomNavBar extends NewsStates {}

class NewsGetBusinessLoadingState extends NewsStates {}

class NewsGetBusinessSucessState extends NewsStates {}

class NewsGetBusinessErorrState extends NewsStates {
  final String error;

  NewsGetBusinessErorrState(this.error);
}

///////////////
class NewsGetSportsLoadingState extends NewsStates {}

class NewsGetSportsSucessState extends NewsStates {}

class NewsGetSportsErorrState extends NewsStates {
  final String error;

  NewsGetSportsErorrState(this.error);
}
///////////////////

class NewsGetScienceLoadingState extends NewsStates {}

class NewsGetsScienceSucessState extends NewsStates {}

class NewsGetScienceErorrState extends NewsStates {
  final String error;

  NewsGetScienceErorrState(this.error);
}

///////////////////////
///
///
///
class NewsGetSearchLoadingState extends NewsStates {}

class NewsGetsSearchSucessState extends NewsStates {}

class NewsGetSearchErorrState extends NewsStates {
  final String error;

  NewsGetSearchErorrState(this.error);
}
